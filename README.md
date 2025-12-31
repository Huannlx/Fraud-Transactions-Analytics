# END-TO-END BANK FRAUD TRANSACTION ANALYSIS PROJECT

## INTRODUCTION

Financial fraud is a critical challenge in the banking and financial services industry, leading to substantial monetary losses and reputational risks. This project focuses on analyzing a large-scale financial transactions dataset containing over 13 million records from 2010 to 2019. 

The aim is to uncover patterns and trends of fraudulent activities across different customer segments, transaction types, and time periods. This project demonstrates how data-driven insights can support fraud detection and risk management.

Raw dataset: [Fraud Transaction](https://www.kaggle.com/datasets/computingvictor/transactions-fraud-datasets)

## PROJECT OBJECTIVES

This project aims to provide comprehensive analyze Fraud Transaction from 2010–2019. Key objectives include:

- Identify the distribution and trends of fraudulent transactions over time.
- Detect high-risk customer profiles based on demographics, income, credit score, and transaction behavior.
- Analyze the number of cards per clients and highlight higher fraud risk among customers holding multiple credit cards
- Visualize fraud occurrences by hour of the day using heatmaps to identify peak fraud periods.
- Provide data-driven insights to support fraud prevention and risk mitigation strategies.

## SKILLS DEMONSTRATED

- **Data Cleaning:** Python (Pandas, NumPy) for preprocessing large datasets.
- **Data Analysis:** SQL for querying business metrics.
- **Visualization:** Power BI for creating interactive dashboards with DAX measures.
- **Version Control:** Git/GitHub for project management.
- **Problem-Solving:** Tackled real-world data challenges like missing values and inconsistent formats.

## PYTHON (Data Cleaning & EDA)

- Removed duplicates and handled missing values.
- Standardized date and categorical formats.
- Conducted exploratory analysis to uncover patterns in fraud occurrences.

## MY SQL QUERIES WERE:

1. How many fraud cases change over time? [Fraud_Query_1](SQL_Server/01_Fraud_cases_trend.sql)
2. What time of day do most fraudulent transactions occur? [Fraud_Query_2](SQL_Server/02_Heatmap_hour_of_the_days.sql)
3. Which merchant_id has the highest fraud rate? [Fraud_Query_3](SQL_Server/03_Fraud_rate_by_merchant.sql)
4. Which merchant city has the highest fraud rate? [Fraud_Query_4](SQL_Server/04_Fraud_rate_by_merchant_city.sql)
5. Which type of transaction has the highest fraud rate? [Fraud_Query_5](SQL_Server/05_Fraud_rate_by_chip_type.sql)
6. Which product category has the most fraudulent transactions? [Fraud_Query_6](SQL_Server/06_Fraud_cases_by_category.sql)
7. Which card brand has the highest fraud rate? [Fraud_Query_7](SQL_Server/07_Fraud_rate_by_card_brand.sql)
8. What impact do chip cards have on fraudulent transactions? [Fraud_Query_8](SQL_Server/08_Fraud_rate_by_has_chip.sql)
9. Which card number has the most fraudulent transactions? [Fraud_Query_9](SQL_Server/09_Fraud_cases_by_card_number.sql)
10. Which gender has the most fraudulent transactions? [Fraud_Query_10](SQL_Server/10_Fraud_cases_by_gender.sql)
11. How does the number of cards held relate to the number of fraudulent transactions? [Fraud_Query_11](SQL_Server/11_number_of_card_hold.sql)
12. Which age group has the highest rate of fraudulent transactions? [Fraud_Query_12](SQL_Server/12_Fraud_cases_by_age_group.sql)
13. Which credit score group has the highest rate of fraudulent transactions? [Fraud_Query_13](SQL_Server/13_Fraud_cases_by_credit_score.sql)
14. Which Income group has the highest rate of fraudulent transactions? [Fraud_Query_14](SQL_Server/14_Fraud_cases_by_income_group.sql)
15. Which Debt group has the highest rate of fraudulent transactions? [Fraud_Query_15](SQL_Server/15_Fraud_cases_by_debt_group.sql)
16. What kind of clients profile is most at risk of fraud? [Fraud_Query_16](SQL_Server/16_Clients_Profile.sql)

## POWER BI

Model View: [MODEL_VIEW](PowerBI/06_Model_view.png)

Dashboard 1: [Bank Fraud Overview](PowerBI/01_Bank_Fraud_Overview.png)

Dashboard 2: [Cards Fraud Detection](PowerBI/02_Cards_Fraud_Detection.png)

Dashboard 3: [Client Statistics](PowerBI/03_Client_Statistics.png)

Dashboard 4: [Client Fraud Overview](PowerBI/04_Client_Fraud_Overview.png)

Dashboard 5: [Client Fraud Details](PowerBI/05_Client_Fraud_Details.png)


Follow the link report: [Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZDQwMWI2MjItN2EyOC00OTQ5LWEzNmItZWQ1MGYwZjQ5M2Q4IiwidCI6ImI3YmQ2YWM0LWUxYjYtNGJlZC1iNWI4LWUyMThiMGFmZTM5MSIsImMiOjF9&pageName=4935a0e300b472a04de0)

## DASHBOARD SUMMARY

Dashboard delivers a comprehensive 360° analysis of credit card fraud across banking operations, card-level risks, merchant behaviors, and client vulnerability profiles through 5 interactive dashboards. It uncovers fraud patterns, high-risk segments, and actionable mitigation strategies to drive proactive risk management and reduce losses.
- Total Transactions: 13.31 millions
- Total Investigated Cases: 8.91 millions
- Fraud Cases: 13.332 cases
- Fraud Amount: 1.47 millions $
- Fraud Rate: 0.15 %

## KEY INSIGHTS

**FRAUD OVERVIEW:**

- Dataset records **13,332 fraud cases**, with **fraud rate of 0.15%**, resulting in a significant **$1.47 Million in fraud losses**.
- Fraud spikes in late summer (peak in **August**) and the holiday season (**December**), with elevated activity consistently on weekends and during daytime hours (**9 AM – 4 PM**).
- **Online** transactions dominate at **65.9% of fraud**, even with 91% of fraudulent cards chip-enabled—indicating chips provide limited protection against sophisticated online threats.

**MERCHANT:**

- High-risk merchant categories include **Department Stores, Wholesale Clubs, and Discount Stores**, accounting for the bulk of cases (**Over 30%**).

- **Geographic Hotspots:** The city of **Rome (3061 Cases)** and certain high-volume merchant IDs (**605669**) are identified as significant fraud hotspots.

**CARDS:**

- **Mastercard (53.3%)** and **Visa (36.2%)** lead fraud volume; **Amex** trails at just **9.6%**.
- Among **4,071 analyzed cards**, 50.6% of flagged ones confirmed fraudulent, multiple cards exceed 10% fraud rates—urgent risky cards for blocking.

**CLIENTS:**

- Clients with **low to medium** credit scores are most vulnerable to fraud, accounting for **74% of cases**.
- Fraud affects clients **aged 36–65 (65.76% of cases)**, females edge out males (**52.37% of victims**).
- Fraud risk is elevated for clients with **3–4 credit cards** and **low yearly income**.
- Highest-risk profile: clients **aged 36–50** with **medium credit scores**, **lower-mid income**, and **medium debt**—this small cohort warrants enhanced monitoring and reduced transaction limits.

## CHALLENGES FACED

- **Handling Data:** handle missing, duplicate data and delete unreasonable data.
- **Performance:** Optimized SQL queries for large datasets by indexing key columns.
- **Visualization:** Use dax to calculate and present key data. Designed intuitive dashboards by iterating on layout and color schemes for clarity.

## TECHNOLOGIES USED

- **Python (Pandas, Numpy)** → Data cleaning and preprocessing
- **Jupyter notebook:** Reproducible code environment
- **SQL Server** → Business queries and analysis
- **Power BI** → Data visualization and interactive dashboard
- **Git/GitHub** → Version control and project management

## CONTACT

I'm passionate about data analysis and always open to feedback or opportunities!

- **LinkedIn:** [My profile](https://www.linkedin.com/in/nguyen-huan/)
- **Email:** nguyenlexuanhuan@gmail.com
- **Medium:** [Medium blog](https://medium.com/@nguyenlexuanhuan)

Star this repo if you find it useful! 🌟 Contributions and suggestions are welcome!
