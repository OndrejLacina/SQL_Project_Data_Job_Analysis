1.  QUERY 1st
    1.
2.  QUERY 2nd
    1.  Celkový pohled (Overall Insights)
        Ztracené inzeráty podruhé: Ze získaných 100 inzerátů jich reálně v tabulce máme jen 94. To znamená, že 6 firem s obrovským rozpočtem vůbec nespecifikovalo konkrétní technologie.

            Svatá trojice vládne: Žebříček nekompromisně vede SQL (požadováno u 82 inzerátů z 94!), následované Pythonem (60) a Tableau (49). Tyto tři věci se objevují s takovou železnou pravidelností, že bez nich u těchto mezinárodních remote pozic nemá smysl ani posílat životopis.

            Power BI vs. Tableau: V tomto vzorku globálních a vysoce placených remote pozic jasně vítězí Tableau (49) nad Power BI (19). Je to klasický americký a "enterprise" fenomén. Power BI ale roste na síle v evropských korporátech, takže pro tvůj start v Brně to byla správná volba.

    2.  Rozpad: Data Analyst (57 inzerátů)
        Tohle jsou pozice, kam primárně míříš.

            1) SQL (47x)
            2) Python (35x)
            3) Tableau (25x)
            4) R (22x)
            5)Excel (18x)

            ## PM Insight: Všimni si, že se na 5. místě pořád drží Excel. Na této mediorní/juniornější úrovni firmy stále vyžadují, abys uměl data nejen vytáhnout z databáze (SQL), ale i rychle zpracovat nebo nasdílet někomu z ne-technického managementu přes "starý dobrý Excel".

    3.  Rozpad: Senior Data Analyst (37 inzerátů)
        Když se podíváme na ty, kteří už mají nějaký ten rok praxe za sebou, struktura dovedností se zajímavě mění:

            1) SQL (35x)
            2) Python (25x)
            3) Tableau (24x)
            4) Looker (13x) - Skokově roste!
            5) R (10x)

            PM Insight (Změna myšlení): Co je tady zásadní? U Seniorů padá Excel až na chvost (pouhých 5 zmínek) a na 4. místo vystřelil Looker (moderní cloudový vizualizační nástroj od Googlu). Zároveň u seniorů začínají vystrkovat růžky tvrdší programovací jazyky jako Go a C. Znamená to jediné: čím jsi seniornější, tím víc od tebe firma čeká architektonická a automatizační řešení (Cloud, pokročilé skripty) a tím méně od tebe chce "klikat kontingenční tabulky".

    # 📊 Top-Paying Data Analyst Roles: Skills & Salary Analysis

    ## 🎯 Objective

    The goal of this project was to analyze the top 100 highest-paying remote Data Analyst and Senior Data Analyst job postings to identify the most critical skills required by top-tier employers.

    ## 💡 Key Business Insights
    1. **The "Big Three" Dominance:** Across the top 100 highest-paying jobs, **SQL** is the absolute baseline (requested in 87% of postings), followed closely by **Python** (63%) and **Tableau** (52%).
    2. **Seniority Shifts the Stack:** While Junior/Medior roles heavily rely on Excel for ad-hoc reporting, Senior roles drop Excel completely in favor of cloud-based architecture and BI tools like Looker and Snowflake.
    3. **The Presentation Premium:** Interestingly, niche skills linked to executive presentation (like PowerPoint) or specialized Big Data tools (Databricks, Azure) correlated with the absolute highest average salaries (averaging over $210,000).
    4. **Regional Differences:** While this global dataset highlights Tableau as the primary BI tool, the European/Czech market heavily favors **Power BI** due to Microsoft ecosystem integration. My personal skill development is aligned with this regional demand (SQL + Power BI + Excel).

    ## 🛠️ Methodology
    - Extracted and filtered data using **PostgreSQL** (CTEs, Subqueries, INNER/LEFT JOINs).
    - Handled missing data (NULL filtering) and applied logical sorting to identify true market trends.

3.  QUERY 3rd
    Question: What are the most in-demand skills for Data Analysts? top 5 skills
    1. Cíl: Zjištění top 5 skills pro Datové analytiky v roce 2023
       - celosvětově

    2. Použil jsem 3 různá řešení
       1. řešení = první logika - delší, řazení nejprve textu (skillů) až pak čísel, náročné na výkon
       2. řešení = optimalizace výkonu - logika numbers first, then text
       3. řešení = praxe CTEs, human logic
    3. SQL techniky
       - základní jako SELECT, FROM, ORDER BY, LIMIT
       - filtering WHERE
       - Aggregations COUNT() + GROUB BY
       - Aliases AS
       - INNER JOIN, procvičení CTEs
