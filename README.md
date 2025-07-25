# 💼 Data Science Job Salaries – SQL + Power BI Project

This project analyzes global data science job salaries using **SQL** for data exploration and **Power BI** for interactive visualizations. The goal is to uncover salary trends, job distribution, and remote work patterns from 2020 to 2024.

---

## 📁 Dataset Overview

The dataset includes:
- Work year (2020–2024)
- Experience level (EN, MI, SE, EX)
- Employment type (FT, PT, CT, FL)
- Job title
- Salary in original currency and USD
- Employee residence & company location
- Remote work ratio
- Company size

---

## 🛠 Tools Used

- 💾 **SQL** – for data cleaning & analysis
- 📊 **Power BI** – for creating dashboards
- 📝 **GitHub** – for version control & publishing

---

## ❓ Key Questions Answered

- 💰 What is the **highest paying job title** overall?
- 🌍 Which **countries offer the highest salaries**?
- 🏠 How do **remote jobs compare to on-site** in salary?
- 🧑‍💼 Is remote work more common in **small or large companies**?
- 📈 How has the **average salary changed from 2020 to 2024**?
- 🧮 What is the **job count per year, employment type, and experience level**?

---

## 📊 Dashboard Preview

![Dashboard Screenshot 1](Screenshot%202025-07-25%20193417.png)
![Dashboard Screenshot 2](Screenshot%202025-07-25%20193732.png)

<!-- Replace with your actual uploaded image name -->

---

## 🔎 SQL Analysis Highlights

```sql
-- Highest paying job title
SELECT job_title, MAX(salary_in_usd) FROM data_science_salaries;

-- Average salary by employee residence
SELECT employee_residence, ROUND(AVG(salary_in_usd), 2)
FROM data_science_salaries
GROUP BY employee_residence;

-- Salary trends over years
SELECT work_year, ROUND(AVG(salary_in_usd), 2)
FROM data_science_salaries
GROUP BY work_year
ORDER BY work_year;
