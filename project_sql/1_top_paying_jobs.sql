/* 
Question: What are the top-paying data anaylst jobs?
    1) Identify the top 10 highest-paying Data Analyst roles that are available remotely.
    2) Focuses on job postings with specified salaries (remove nulls)
    - Why? Highlight the top-paying opportunities for Data Analysts, offering insight into employment options and location flexibility 
    ADD1) Which company?
    ADD2) TOP 20 Data Analysts + Senior Data Analyst
*/

SELECT 
    j.job_id,
    j.job_title_short, -- pro přehlednost
    j.job_title,
    j.salary_year_avg,
    c.name,
    j.job_location,
    j.job_schedule_type,
    j.job_posted_date
FROM 
    job_postings_fact AS j
LEFT JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE 
    salary_year_avg IS NOT NULL AND 
    job_location = 'Anywhere' AND
    job_title_short IN ('Data Analyst', 'Senior Data Analyst')
ORDER BY salary_year_avg DESC
LIMIT 20;