**HR DASHBOARD BY POWER B.I**
![HR DASH](https://github.com/user-attachments/assets/873b1602-b3cf-4e2c-b01c-72cff1eb14c7)
![HR dash 2](https://github.com/user-attachments/assets/9372804f-fae7-44a6-a91f-e1dafa242377)

**Data Used**
1. Data: HR Data with over 22,000 rows from the year 2000 to 2020.

2. Data Cleaning & Analysis: MySQL, Jupyter Notebook (sql magic)

3. Data Visualization: Power BI


**Questions**
1. What is the gender breakdown of employees in the company?
   
2. What is the age distribution of employees in the company?
   
3. How many employees work at headquarters versus remote locations?
   
4. What is the average length of employment for employees who have been terminated?
    
5. How does the gender distribution vary across departments and job titles?
    
6. What is the distribution of job titles across the company?
    
7. Which department has the highest turnover rate?
    
10. What is the distribution of employees across locations by state?

11. How has the company's employee count changed over time based on hire and termination dates?
    
12. What is the tenure distribution for each department?

**Summary of Findings**
1.There are more male employees.

2. The youngest employee is 20 years old and the oldest is 57 years old.

3. 5 age groups were created (18–24, 25–34, 35–44, 45–54, 55–64). A large number of employees were between 25–34 followed by 35–44, while the smallest group was 55–64.

4. A large number of employees work at the headquarters versus remotely.

5. The average length of employment for terminated employees is around 7 years.

6. The gender distribution across departments is fairly balanced but there are generally more male than female employees.

7. The Marketing department has the highest turnover rate followed by Training. The least turnover rates are in the Research and Development, Support, and Legal departments.

8. A large number of employees come from the state of Ohio.

9. The net change in employees has increased over the years.

10. The average tenure for each department is about 8 years, with Legal and Auditing having the highest and Services, Sales, and Marketing having the lowest.

**Limitations**
1. Some records had negative ages and these were excluded during querying (967 records). Ages used were 18 years and above.

2. Some term dates were far into the future and were not included in the analysis (1599 records). The only term dates used were those less than or equal to the current date.

