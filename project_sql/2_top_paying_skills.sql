/* 
Question: What skills are required for the top-paying data analyst jobs?
    1) Use the top 10 highest-paying Data Analyst jobs from first query
    2) Add the specific skills required for these roles
    - WHY? it provides a detailed look at which high-paying jobs demand certain skill, helping job seekers understand which skills to develop that align with top salaries

    - použil jsem syntaxi z předchozího úkolu - používám pořád roli senior DA + rozšíření na TOP 100
    - vložil do CTE
    - vytvořil nové inner join a uložil výsledek do .csv
*/

WITH top_paying_jobs AS (
    SELECT 
        j.job_id,
        j.job_title,
        j.salary_year_avg,
        c.name,
        j.job_title_short
    FROM 
        job_postings_fact AS j
    LEFT JOIN company_dim AS c
        ON j.company_id = c.company_id
    WHERE 
        salary_year_avg IS NOT NULL AND 
        job_location = 'Anywhere' AND
        job_title_short IN ('Data Analyst', 'Senior Data Analyst')
    ORDER BY salary_year_avg DESC
    LIMIT 100
    )

SELECT 
    top_paying_jobs.*,
    s.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim AS sj 
    ON sj.job_id= top_paying_jobs.job_id
INNER JOIN skills_dim AS s
    ON s.skill_id = sj.skill_id
ORDER BY top_paying_jobs.salary_year_avg DESC -- best practice - ORDER BY vždy na konci celého, finálního dotazu

/* */

