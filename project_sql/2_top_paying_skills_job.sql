/* 
QUESTION: What skills are required for the 100 top-paying data analyst jobs remotely?
    1) Use the top highest-paying Data Analyst companies from first query
    2) Add the specific skills required for these roles and companies
WHY? It provides a detailed look at which high-paying jobs (and companies) demand certain skill, helping job seekers understand which skills to develop that align with top salaries

    - rozšíření na TOP 100 a vložení do CTE
    - vytvořil nové inner join a uložil výsledek do .csv
    - vizualizace výsledku v Readme

*/

WITH top_paying_jobs AS (
    SELECT 
        j.job_id,
        c.name AS company_name,
        j.salary_year_avg
    FROM 
        job_postings_fact AS j
    LEFT JOIN company_dim AS c
        ON j.company_id = c.company_id
    WHERE 
        salary_year_avg IS NOT NULL AND 
        job_location = 'Anywhere' AND
        job_title_short IN ('Data Analyst')
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



