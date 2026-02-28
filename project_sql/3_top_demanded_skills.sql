/*
Question: What are the most in-demand skills for data analysts?
    1. join job postings to inner join table similar to query 2
    2. identify the top 5 in-demand skills for a data analyst
    3. focus on all job postings
    Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.

My notes: 
    - použiji zde 3 různá řešení (1. mé úplně první řešení použité v průběhu kurzu, 2. vylepšené pro rychlejší výpočet, 3. nejkratší)
*/

-- 3. řešení - short as possible
SELECT 
    sd.skill_id,
    skills,
    COUNT(sjd.job_id) AS count_of_skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills,
    sd.skill_id
ORDER BY
    count_of_skills DESC
LIMIT 5


-- 2. řešení - number first, text after (best logic for pc) practice CTEs
WITH skills_total AS
    (
    SELECT
        sjd.skill_id,
        COUNT(*) AS count_of_skills
    FROM 
        skills_job_dim AS sjd 
    INNER JOIN job_postings_fact AS jpf
        ON sjd.job_id = jpf.job_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
    GROUP BY
        sjd.skill_id
    )

SELECT
    skills_total.*,
    sd.skills
FROM skills_total
INNER JOIN skills_dim AS sd
    ON skills_total.skill_id = sd.skill_id
ORDER BY
    count_of_skills DESC
LIMIT 5;




-- 1. řešení - human logic (practice CTEs)
WITH remote_job_skills AS ( -- 1st step
    SELECT
        job_postings_fact.job_id,
        job_postings_fact.job_title_short,
        job_postings_fact.job_location,
        skills_dim.skills,
        skills_dim.skill_id
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim
            ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim
            ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        -- job_postings_fact.job_location = 'Anywhere' AND
        job_postings_fact.job_title_short = 'Data Analyst'
)

SELECT -- 2nd step
    skill_id,
    skills,
    COUNT(job_id) AS total_postings  -- Počítáme inzeráty
FROM 
    remote_job_skills -- toto tahám z WITH tabulky
GROUP BY 
    skill_id,     -- Dle zlatého pravidla: co je v SELECTu musí být i v GROUP BY
    skills                           
ORDER BY 
    total_postings DESC          
LIMIT 5;