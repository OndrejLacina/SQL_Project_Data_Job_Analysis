# 📊 Data Analyst Job Market Analysis 2023: SQL Portfolio Project

## 🎯 Project Overview

This project explores the data analyst job market in 2023, analyzing top-paying roles, in-demand skills, and the intersection of salary and demand. The ultimate goal is to identify the most optimal technologies to master for an aspiring Data Analyst entering the job market.

## 🛠️ Tools & Technologies

- **SQL (PostgreSQL):** Complex queries involving CTEs (Common Table Expressions), multiple `INNER`/`LEFT JOIN`s, aggregations (`COUNT`, `AVG`, `ROUND`), filtering (`WHERE`, `HAVING`), data formatting, logical sorting.
- **Database Architecture:** Utilizing a star schema consisting of a main fact table (`job_postings_fact`) and supporting dimension tables (`skills_dim`, `company_dim`).
- **VS Code:** My IDE to executing the SQL and coding
- **Git & GitHub:** version control and sharing my SQL queries and the project

### 🔍 SQL queries? Check them out here:

- [project_sql folder](/project_sql/)

## ✅ The 5 Core Questions Answered

1. **Top-Paying Roles:** What are the top 10 highest-paying Data Analyst jobs available remotely?
2. **Elite Skill Requirements:** What specific technical skills do these top-paying roles demand?
3. **Market Demand:** What are the most frequently requested skills for Data Analysts across the entire job market?
4. **Salary-Driven Skills:** Which technical skills are associated with the highest average salaries? (My modification: What is the average pay for each skill?)
5. **The Optimal Stack:** Which skills represent the "sweet spot" by offering both high market demand and high financial rewards?

## 💡 Key Business Insights

- **The Baseline:** The absolute foundation is **SQL**, appearing in the vast majority of job postings. Along with **Python** and visual tools (**Tableau / Power BI**), they form the "Big Three" of data analytics. However, **Excel** also has a huge presence, especially for the Data Analyst role
- **Beware of the "Niche Trap":** While highly specialized skills (like obscure cloud tools) show massive average salaries, their job market in 2023 demand is extremely low. Relying purely on salary data without checking the posting volume (`COUNT`) creates a skewed perspective.
- **Regional Strategy:** While the global remote market heavily features Tableau and Looker, the European and enterprise markets are deeply rooted in the Microsoft ecosystem. A foundational stack of **SQL, Excel, and Power BI** is the most strategic entry point for Junior/Medior roles.

## 🚀 Personal Takeaways

Over the course of a 3-week intensive sprint, I went from no knowledge of SQL through writing basic queries to understanding deeper database mechanics, such as handling missing data (`NULL` values) and optimizing query performance by choosing single-pass aggregations over unnecessary CTEs where appropriate.

## My Next Steps

- **Mastering Advanced Excel (Power Query/Power Pivot)**
- **Work on PowerBI**
- **Improve this SQL project**
  1. add actuall data
  2. Q6 - What is the best paying company - list
