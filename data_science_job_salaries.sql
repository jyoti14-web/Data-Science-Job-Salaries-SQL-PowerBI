USE data_science_job_salaries;
DROP TABLE IF EXISTS data_science_salaries;
CREATE TABLE data_science_salaries (
    work_year INT,
    experience_level VARCHAR(10),
    employment_type VARCHAR(10),
    job_title VARCHAR(100),
    salary FLOAT,
    salary_currency VARCHAR(10),
    salary_in_usd FLOAT,
    employee_residence VARCHAR(50),
    remote_ratio INT,
    company_location VARCHAR(50),
    company_size VARCHAR(10)
);
 -- 1. Average Salary (USD) by Job Title
SELECT * FROM data_science_salaries LIMIT 10;
SELECT job_title, Round(AVG(salary_in_usd), 2) as avg_salary_usd
FROM data_science_salaries
GROUP BY job_title
ORDER BY avg_salary_usd DESC;

-- 2. what is the highest paying job title overall?
SELECT job_title, Round(AVG(salary_in_usd),2) as avg_salary_usd
FROM data_science_salaries
GROUP BY job_title
ORDER BY avg_salary_usd DESC
LIMIT 1;

-- 3. which company size pays the most an average?
SELECT company_size, ROUND(AVG(salary_in_usd),2) as avg_salary_usd
FROM data_science_salaries
GROUP BY company_size
ORDER BY avg_salary_usd DESC;

-- 4. how does salary vary across different experence level ?
SELECT experience_level, ROUND(AVG(salary_in_usd),2) as avg_salary_usd
FROM data_science_salaries
GROUP BY experience_level
ORDER BY avg_salary_usd DESC;

-- 5. what is the average salary for remote vs. on site job?
SELECT 
CASE 
WHEN remote_ratio = 0 THEN 'On-site'
WHEN remote_ratio = 50 THEN 'Partially Remote'
WHEN remote_ratio = 100 THEN 'Fully Remote'
ELSE 'Other'
END AS work_mode,
Round(AVG(salary_in_usd), 2) AS avg_salary_usd
FROM data_science_salaries
GROUP BY remote_ratio
ORDER BY remote_ratio;

-- --6. How many fully remote job vs on site vs. hybrid exists?
SELECT 
CASE 
WHEN remote_ratio = 0 THEN 'On-site'
WHEN remote_ratio = 50 THEN 'Partially Remote'
WHEN remote_ratio = 100 THEN 'Fully Remote'
ELSE 'Other'
END AS work_mode,
count(*) AS total_jobs
FROM data_science_salaries
GROUP BY remote_ratio
ORDER BY work_mode;

-- 7. which countries offer the most remote role?
SELECT 
company_location,
count(*) AS total_fully_remote_jobs
FROM data_science_salaries
WHERE remote_ratio = 100
GROUP BY company_location
ORDER BY total_fully_remote_jobs;

-- 8. Is remote work more common in small or large companies?
SELECT 
    company_size,
    COUNT(*) AS total_jobs,
    SUM(CASE WHEN remote_ratio = 100 THEN 1 ELSE 0 END) AS fully_remote_jobs,
    ROUND(SUM(CASE WHEN remote_ratio = 100 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percent_remote_jobs
FROM 
    data_science_salaries
GROUP BY 
    company_size
ORDER BY 
    percent_remote_jobs DESC;

-- 9. What is the avg. salary by employee residence?
SELECT employee_residence,
Round(avg(salary_in_usd), 2) AS avg_salary
FROM data_science_salaries
GROUP BY employee_residence
ORDER BY avg_salary DESC;

-- 10. which country has the highest paying jobs?

SELECT company_location,
Round(avg(salary_in_usd), 2) AS avg_salary_usd
FROM data_science_salaries
GROUP BY company_location
ORDER BY avg_salary_usd DESC;

-- 11. What is the salary difference between employee residence and company location?

SELECT 
CASE 
WHEN employee_residence = company_location THEN 'same country'
ELSE 'different country'
END AS location_type,
count(*) AS total_jobs,
Round(avg(salary_in_usd), 2) as avg_salary_usd
From data_science_salaries
GROUP BY location_type;

-- 12. How has the avg. salary changed from 2020 to 2024?
SELECT work_year,
Round(avg(salary_in_usd), 2) AS avg_salary_usd
FROM data_science_salaries
GROUP BY work_year
ORDER BY avg_salary_usd;

-- 13. which year had the highest no. of job records?
SELECT work_year,
Count(*) as total_jobs
FROM data_science_salaries
Group by work_year
ORDER BY total_jobs;

-- 14. How many jobs are full time vs. part time vs. contract?

SELECT 
employeement_type, 
Count(*) As total_jobs
FROM data_science_salaries
GROUP BY employement_type
ORDER BY total_jobs;

-- 15. Which employeement types pays the highest avg. salary for excutive level role?

SELECT employeement_type,
Round(avg(salary_in_usd), 2) as avg_salary_usd,
Count(*) as total_excutives
FROM data_science_salaries
WHERE experience_level = 'EX'
GROUP BY employeement_type
ORDER BY avg_salary_usd DESC;







