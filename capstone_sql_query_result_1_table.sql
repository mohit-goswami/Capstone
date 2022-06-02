
/* Step 1 (SQL): The data will be available in mysql. You have to read the data and perform queries before moving to the next step. 
-- Apply appropriate normalization techniques (upto 3 NF) to divide it into multiple tables --
# Queries 
	1. Find the average number of medals won by each country
	2. Display the countries and the number of gold medals they have won in decreasing order
	3. Display the list of people and the medals they have won in descending order, grouped by their country
	4. Display the list of people with the medals they have won according to their their age
	5. Which country has won the most number of medals (cumulative)
*/
-- select * from `olympic_detail`;
-- 1. Find the average number of medals won by each country --
select country , round(avg(total_medal),1)
from olympic_detail
group by country  
order by round(avg(total_medal),1) desc ;

-- 2. Display the countries and the number of gold medals they have won in decreasing order --

select country , sum(gold_medal)
from olympic_detail
group by country 
order by sum(gold_medal) desc ;

-- 3. Display the list of people and the medals they have won in descending order, grouped by their country --

select  country,name, sum(total_medal)
from olympic_detail
group by country ,name
order by sum(total_medal) desc ;

-- 4. Display the list of people with the medals they have won according to their their age --
select  age,name,total_medal
from olympic_detail
group by name,age
order by age desc ;

-- 5. Which country has won the most number of medals (cumulative) --
select  country,sum(total_medal)
from olympic_detail
group by country 
order by sum(total_medal) desc 
limit 1;