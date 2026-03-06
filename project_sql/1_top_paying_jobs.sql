/* 
QUESTION: What were the top-paying companies for data anaylst remotely(2023-2025)?
    1) Identify the top 25 highest-paying Data Analyst roles/companies that are available remotely.
    2) Focuses on job postings with specified salaries (remove nulls)
    - Why? Highlight the top-paying opportunities for Data Analysts, offering insight into employment options and location flexibility 

ADD1) původně bylo top paying roles, ale nedávalo to až tolik smysl -> změna na companies

*/

SELECT 
    j.job_id,
    j.job_title,
    j.salary_year_avg,
    c.name,
    -- j.job_schedule_type, (full-time)
    j.job_posted_date
FROM 
    job_postings_fact AS j
LEFT JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE 
    salary_year_avg IS NOT NULL AND 
    job_location = 'Anywhere' AND
    job_title_short IN ('Data Analyst')
ORDER BY salary_year_avg DESC
LIMIT 25;