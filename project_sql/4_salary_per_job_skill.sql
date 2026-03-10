/*
Question: What are the top skills based on salary?
    - Look at the average salary associated with each skill for Data Analyst
    - Focuses on roles with specified salaries, regardless of location
    Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewardins skill to asquire or improve 
*/

-- vybírám nejužitečnější skilly pro DA dle počtu inzerátů a podle průměrného platu pro daný skill, resp. který skill má největší váhu pro ohodnocení
-- fakticky je toto spojení ukolu 4 a 5

SELECT
    s.skills,
    COUNT(j.job_id) AS count_of_jobs,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
INNER JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id
WHERE
    j.job_title_short = 'Data Analyst' AND
    j.salary_year_avg IS NOT NULL 
    -- AND j.job_location = 'Anywhere'
GROUP BY
    s.skills
HAVING
    COUNT(j.job_id) > 10 --  version avg_salary DESC
ORDER BY 
    count_of_jobs DESC
    -- avg_salary DESC
LIMIT 15;
