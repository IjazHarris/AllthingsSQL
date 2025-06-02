USE projects;
SELECT * FROM hr;

---- Upon importing raw data, data clean up must be done

----- This changes ï»¿id to emp_id with data type included

ALTER TABLE hr CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL; 

SET sql_safe_updates = 0;

----- Updating contents of birthdate. Replacing any '/' with '-' whilst converting  the date in desired format

UPDATE hr SET birthdate=CASE
 WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
  WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
  ELSE NULL
  END;
  
  SELECT birthdate FROM hr;
  
  ------ Converting data type from text to date
  
  ALTER TABLE hr MODIFY COLUMN birthdate DATE;
  
  ----- Updating contents of colomn hr_date. Replacing any '/' and '-' whilst converting  the date in desired format
  UPDATE hr SET hire_date=CASE
 WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
  WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
  ELSE NULL
  END;
  
 ------ Converting data type from text to date
 
 ALTER TABLE hr MODIFY COLUMN hire_date DATE;

---- Modifying column by modifying the date time format to only showcasing the date

UPDATE hr SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')) WHERE termdate IS NOT NULL AND termdate != '';

SELECT termdate FROM hr;
DESCRIBE hr;

SELECT COUNT(*) AS empty_count
FROM hr
WHERE termdate = '';

UPDATE hr
SET termdate = NULL
WHERE termdate = '';

---- Converting data type from text to date

 ALTER TABLE hr MODIFY COLUMN termdate DATE;
 
 ---- Adding column 'age'
 
 ALTER TABLE hr ADD COLUMN age INT;
 
 ---- Identifying employees age
 
 UPDATE hr SET age = TIMESTAMPDIFF(YEAR,birthdate,CURDATE());
 
 SELECT MIN(age) AS youngest,MAX(age)  AS oldest FROM hr;
 
 ---- To be excluded from analysis
 
 SELECT COUNT(*) FROM hr WHERE age < 18;
 
 ----- Analysis starts
 
 SELECT termdate FROM hr;
 
 --- 1. What is the gender breakdown of employees in the company?
	SELECT gender, COUNT(*) AS count
    FROM hr WHERE age >= 18 AND termdate IS NULL
    GROUP BY gender;
    
--- 2. What is the race/ethnicity breakdown of employees in the company?
	SELECT race, COUNT(*) AS count
    FROM hr WHERE age >= 18 AND termdate IS NULL
    GROUP BY race 
    ORDER BY count DESC;
    
    --- 3. What is the distribution of employees in the company?
    
    SELECT MIN(age) AS youngest, MAX(age) AS oldest 
    FROM hr WHERE age >= 18 AND termdate IS NULL;
    
    --- Breakdown by age_group
    
    SELECT  CASE 
			WHEN age BETWEEN 18 AND 24 THEN '18-24'
			WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
			WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65+'
END AS age_group,
            COUNT(*) AS count
            FROM hr WHERE age >= 18 AND termdate IS NULL
            GROUP BY age_group ORDER by age_group;
            
--------- Breakdown by age group and gender
            SELECT  CASE 
			WHEN age BETWEEN 18 AND 24 THEN '18-24'
			WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
			WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65+'
END AS age_group, gender,
            COUNT(*) AS count
            FROM hr WHERE age >= 18 AND termdate IS NULL
            GROUP BY age_group,gender 
            ORDER by age_group,gender;
            
-------- How many empoyees are working remotely vs at HQ?

SELECT location, COUNT(*) FROM hr
 WHERE age >= 18 AND termdate IS NULL 
 GROUP BY location;
 
 ----------- 5. What is the average length of employment for employees who have been terminated?
 
 SELECT ROUND(AVG(datediff(termdate,hire_date))/365,0) AS average_years
 FROM hr WHERE termdate <= CURDATE()  AND termdate IS NOT NULL AND age >= 18
 ;
 
 -------- 6. How does the gender distribution vary across departments ?
 
 SELECT gender,department,COUNT(*) AS Count FROM hr
  WHERE age >= 18 AND termdate IS NULL GROUP BY 
  department,gender ORDER BY department;
  
  --------- 7. What is the distribution of job titles across the company?
  
  SELECT jobtitle, COUNT(*) AS Count FROM hr
  WHERE age >= 18 AND termdate IS NULL 
  GROUP BY jobtitle ORDER BY jobtitle DESC;
  
  --------- 8. Which department has the highest turnover rate?
  
  SELECT 
      department,
	  total_count,
	  terminated_count/total_count AS termination_rate
FROM ( 
  SELECT department, 
			count(*) AS total_count,
                SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE()  THEN 1 ELSE 0 END ) AS terminated_count
                 FROM hr WHERE age >= 18 GROUP BY department) AS subquery  ORDER BY termination_rate DESC;
                 
---- What is the distribution of employees across locations and state?

SELECT location_state, COUNT(*) AS COUNT 
FROM hr
WHERE age >= 18 AND termdate IS NULL 
GROUP BY location_state ORDER BY COUNT DESC;

----- HOW HAS THE COMPANY'S EMPLOYEE COUNT CHANGED OVER TIME BASED ON HIRE AND TERM DATES?

SELECT 
   year,
   hire,
   termination,
   hire-termination AS net_change,
   round((hire-termination)/hire * 100,2) AS net_changed_overtime
   FROM ( SELECT YEAR(hire_date) AS year,
		  COUNT(*) AS hire,
		SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE()  THEN 1 ELSE 0 END ) AS termination FROM hr
        WHERE age >= 18 GROUP BY YEAR(hire_date) ) AS subquery  ORDER BY year;
        
------ 11. What is tenure distribution for each department?

SELECT department, ROUND(AVG(datediff(termdate,hire_date)/365),0) AS Average_tenure
FROM hr WHERE termdate<=curdate() AND termdate IS NOT NULL
GROUP BY department;
	  
 

  
  
 