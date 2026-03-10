/*
QUESTION: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill) for a data analyst?
    - Identify skills in high demand and associated with high average salaries for Data Analyst roles
    - Concentrates on remote positions with specified salaries

*/

-- total_jobs = CTE helper to calculate rate in %
WITH total_jobs AS ( 
    SELECT
        COUNT(job_id) AS total_postings
    FROM 
        job_postings_fact
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
),

-- main Query - Data Analyst, count_of_jobs, avg_salary
skill_stats AS (
    SELECT
        s.skills,
        COUNT(j.job_id) AS count_of_jobs,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj
        ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS s
        ON sj.skill_id = s.skill_id
    WHERE
        j.job_title_short = 'Data Analyst' AND
        j.salary_year_avg IS NOT NULL
    GROUP BY
        s.skills
    HAVING
        COUNT(j.job_id) > 10
    ),

-- third CTEs - percentage helper to demand_rate
percentage_helper AS (
    SELECT
        ss.skills,
        ss.count_of_jobs,
        ss.avg_salary,
        -- % calculation: (amount of postings / total count of postings) * 100
        ROUND((ss.count_of_jobs::NUMERIC / tj.total_postings) * 100, 2) AS demand_rate
    FROM
        skill_stats AS ss
    CROSS JOIN 
        total_jobs AS tj
    )

-- main query - SQL know demand_rate, CASE WHEN is functional
SELECT
    ph.skills, 
    ph.count_of_jobs,
    ph.avg_salary,
    ph.demand_rate,
        CASE 
            WHEN ph.demand_rate >= 18 AND ph.avg_salary >= 100000 THEN '1) Optimal (High Demand, High Pay)'
            WHEN ph.demand_rate > 18 AND ph.avg_salary < 100000 THEN '2) Demand (High Demand, Lower Pay)'
            WHEN ph.demand_rate <= 18 AND ph.avg_salary >= 100000 THEN '3) Preminum skill (Lower Demand, High Pay)'
            WHEN ph.demand_rate <= 18 AND ph.avg_salary >= 90000 THEN '4) Solid choice (Lower Demand, Solid Pay)'
            -- WHEN count_of_jobs <= 18 AND avg_salary < 100000 THEN 
            ELSE '5) Low value (Low Demand, Low Pay)'
        END AS skill_category
FROM percentage_helper AS ph
ORDER BY
    demand_rate DESC
    -- count_of_jobs DESC
    -- avg_salary DESC

