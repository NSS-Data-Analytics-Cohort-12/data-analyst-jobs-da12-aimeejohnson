-- 1.	How many rows are in the data_analyst_jobs table?

SELECT *
FROM data_analyst_jobs

--1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT*
FROM data_analyst_jobs
LIMIT 10;

--"ExxonMobil"

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(location) AS number_of_postings
FROM data_analyst_jobs
WHERE location IN ('TN','KY');

--Tennessee: 21, Tennessee or Kentucky:27

-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT*
FROM data_analyst_jobs
WHERE location = 'TN'
	AND star_rating > 4;

-- 3 postings

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 151

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location;

--KS

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT title
FROM data_analyst_jobs;

--881

-- 8.	How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--230

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company,AVG(star_rating) AS average_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

--41

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company,AVG(star_rating) AS average_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY average_star_rating DESC;

--General Motors, 4.1999998090000000

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

-- 1636

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
	AND title NOT LIKE '%analyst%'
	AND title NOT LIKE '%ANALYST%'
	AND title NOT LIKE '%Analytics%'
	AND title NOT LIKE '%analytics%'
	AND title NOT LIKE '%ANALYTICS%';

--Tableau

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT domain, COUNT(*) AS number_of_jobs
FROM data_analyst_jobs
WHERE skill = 'SQL'
	AND days_since_posting > 21
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY number_of_jobs DESC;

-- 1. Consulting and Business Services, 5
-- 2. Consumer Goods and Services, 2
-- 3. Computers and Electronics, 1
-- 4. Internet and Software, 1
--Total number of jobs in the top four = 9
