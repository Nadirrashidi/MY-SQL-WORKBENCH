# creation of database 
create database session_32 ;

# select all
select * from smartphones;

#filter cols 
select brand_name,model from smartphones;

#filter cols 
select model,price,rating from session_32.smartphones

-- Alias :
-- Aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias only exists for the duration of that query.
-- An alias is created with the AS keyword.

SELECT os as 'operating system' from session_32.smartphones
select os as 'operating system' , price as 'price rs' from session_32.smartphones

-- constant column
select model , 'smartphone' as type from smartphones;

-- Distinct (unique) value from the cols
-- fetch unique names of brand_name
select brand_name from smartphones;
-- single cols
select distinct brand_name from smartphones;
select distinct os from smartphones;

-- multi cols ( distinct combination )
select distinct brand_name,processor_brand from smartphones;

-- filter rows based on where clause
-- Q1.Find all samsung phones
select brand_name , price from smartphones 
where brand_name='samsung';

-- Q2.Fetch all the records of samsung 
select * from smartphones where 
brand_name='samsung';

-- Q3.find all phones with price > 50000
select brand_name, price  from smartphones where price >50000

-- between
# Q4.find all phones in the price range of 10000 and 20000

select brand_name , price from smartphones where price between 10000 and 20000 ;

# Q5.Find the phones with rating > 80 and price < 25000
select rating , price from smartphones where rating >80 and
 price < 25000  ;
# Q6.Find all the samsung phones with ram > 8gb
select brand_name , ram_capacity ,price , processor_brand from smartphones where 
brand_name='samsung' AND ram_capacity>8

# Q7.Find all samsung phones with snapdragon processor 
select brand_name,processor_brand from smartphones 
where brand_name='samsung'and  processor_brand='snapdragon'

-- IN : The IN operator allows you to specify multiple values in a 
WHERE clause.
select brand_name,processor_brand from smartphones 
where brand_name IN ('samsung' , 'oneplus','relme')

# update : used for updating the records
update smartphones set processor_brand ='medisity' 
where processor_brand='dimensity' 


-- delete
 select * from smartphones
 where price > 200000
 
 delete from smartphones
 where price > 200000
 
 -- aggregate functions 
 -- min / max
 # Q:Find the minimum and maximun price
select max(price)  from smartphones;
select min(price)  from smartphones;

# Q : Find the price of costiest samsung phones
select  max(price) from smartphones where
brand_name='samsung';

select price,ram_capacity from smartphones where
brand_name='samsung' and price=110999
-- AVG
# Q:find the avg ratings of apple phones
select avg(rating) from smartphones where brand_name='apple'

# count : count number of instance
# Q : count the number of phones of oneplus
select count(*) from smartphones
where brand_name='oneplus'	

# distict count 
# Q:Find the number of brands 
select count(distinct(brand_name)) from smartphones;

# Tasks 
-- DataSet - https://docs.google.com/spreadsheets/d/e/2PACX-1vRa1wWwXmzxEvqITxj4OQTeLywlGTTsOTbhSRqKj2lPuGefjlci-DQhgLBPpgWXe8AAUu2WUBqY59X1/pub?gid=1030172542&single=true&output=csv
-- Look for data description
-- Kaggle - https://www.kaggle.com/datasets/thedevastator/insurance-claim-analysis-demographic-and-health?select=insurance_data.csv

select * from insurance_data

-- 1.Show records of 'male' patient from 'southwest' region.

select * from insurance_data where gender='male' and region ='southwest';

-- 2 .Show all records having bmi in range 30 to 45 both inclusive..
select * from insurance_data where bmi between 30 and 45

-- 3.Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively.
select min(bloodpressure) from insurance_data where diabetic='Yes' and smoker='Yes' ;
select max(bloodpressure) from insurance_data where diabetic='Yes' and smoker='Yes' ;

-- 4.Find no of unique patients who are not from southwest region.
select distinct(count('PatientID')) from insurance_data where region != 'southwest'
-- 5.Total claim amount from male smoker.
select sum(claim) from insurance_data where smoker='Yes' and gender='male'
select sum(claim) from insurance_data where smoker='no' and gender='male'

-- 6.Select all records of south region.
SELECT * FROM INSURANCE_DATA WHERE REGION in ('southeast','southwest')

-- 7.No of patient having normal blood pressure. Normal range[90-120]
select count(bloodpressure) from insurance_data where bloodpressure between 90 and 120

-- session 33 
select * from smartphones
-- sorting Data 
-- Q1.find top 5 samsung phones with biggest screen size

select brand_name , screen_size from smartphones where 
brand_name='samsung' order by screen_size desc limit 5

-- Q2.sort all the phone with in descending order of numbers of total cameras
select (num_rear_cameras) + (num_front_cameras) 
AS total_cameras , brand_name, model  FROM smartphones order by total_cameras desc

-- Q3.sort data on the basis of ppi in desending order
SELECT 
    model,
    (SQRT(POW(resolution_width, 2) + POW(resolution_height, 2)) / screen_size) AS ppi
FROM 
    smartphones order by ppi desc;
-- Q4 . Find the phone with the 2nd largest battery
select model, battery_capacity from smartphones order by 
battery_capacity desc limit 1,1

-- Q5.find the model  and rating of the worst rated apple phone
SELECT model , rating from smartphones where brand_name='apple' order by rating asc
limit 1

-- Q6.sort the brand_name in ascending and price ascending

select * from smartphones 
order by brand_name asc , price asc

-- Group by : The GROUP BY statement groups rows that have the same values into summary 
-- rows, like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions
-- (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

-- Q1.group smartphones by brand and get the count , avg price , max rating, avg screen size
-- and avg battery capacity
select brand_name, count(*) as 'num of phones' ,avg(price) , max(rating) , avg(screen_size)
from smartphones group by brand_name

-- Q2.Group by smartphones wheather they have an nfc and get the avg price and avg rating
select has_nfc,avg(price),avg(rating) from smartphones group by has_nfc

-- group by on multiple cols
-- Q4.Group smartphones by the brand and processor brand and get the count of
-- models and the average primary camera resolution (rear)

Select brand_name , processor_brand ,count(*) , avg(primary_camera_rear) 
from smartphones group by brand_name ,processor_brand

-- Q5 .Find the top 5 most costly phone brands
select brand_name, avg(price) as 'avg_price' from smartphones group by brand_name 
order by avg_price desc limit 5

-- Q6.Which brand makes the smallest-screen smartphones
select brand_name, avg(screen_size) as 'avg_screen_size' from smartphones group by brand_name 
order by avg_screen_size asc limit 1

-- Q7.AVG PRICE OF 5G PHONE VS AVG PRICE OF NON 5G PHONES
SELECT 
    has_5g,AVG(price) AS Average_Price FROM smartphones GROUP BY has_5g;

-- Q8.GROUP SMARTPHONES BY BRAND AND FIND THE BRAND WITH THE HIGHEST NUMBER OF 
-- MODELS THAT HAVE BOTH NFC AND IR BLASTER
select brand_name ,count(*) as 'count'  from smartphones 
where has_nfc='True' and has_ir_blaster='True' group by brand_name order by count desc limit 1
-- Q9.Find all Samsung 5g enabled smartphones and find out the avg price for NFC and Non-NFC phones
select  avg(price) as avg_price ,has_nfc from smartphones where brand_name='samsung' group by has_nfc

-- Having CLAUSE 
-- Q1.Costliest Brand which has at least 20 phones. 
select avg(price) as avg_price ,count(*) as count  ,brand_name from smartphones 
group by brand_name  having count > 20 order by
avg_price desc

-- Q2. find the avg rating of smartphone brands that have more than 20 phones
select brand_name,count(*) as count ,avg(rating) as 'avg_rating'
from smartphones group by brand_name having count >40 order by avg_rating desc
-- Q3. Find the top 3 brands with the highest avg ram that has a refresh rate of at least 90 Hz and fast charging 
-- available and don't consider brands that have less than 10 phones
select brand_name,avg(ram_capacity) as 'avg_ram' ,count(*) as count from smartphones
where refresh_rate > 90 and fast_charging_available = 1 
group by brand_name having count > 10 order by 'avg_ram' desc limit 3
-- Q4.Find the avg price of all the phone brands with avg rating of 70 and num_phones more than 10 among all 5g enabled phones
select brand_name , avg(price) as 'avg_price' , count(*) as count from smartphones
where has_5g='True'
group by brand_name
having avg(rating) > 70 and count > 10 order by 'avg_price' desc

-- Task 
-- FOR QUESTION 1 TO 5 DATA NAME IS SLEEP_EFFICIENCY DESCRIPTION IS
-- ID a unique identifier for each test subject
-- Age age of the test subject
-- Gender male or female
-- Bedtime the time the test subject goes to bed each night
-- Wakeup time the time the test subject wakes up each morning
-- Sleep duration the total amount of time the test subject slept (in hours)
-- Sleep efficiency a measure of the proportion of time in bed spent asleep
-- REM sleep percentage the percentage of total sleep time spent in REM sleep
-- Deep sleep percentage the percentage of total sleep time spent in deep sleep
-- Light sleep percentage the percentage of total sleep time spent in light sleep
-- Awakenings the number of times the test subject wakes up during the night
-- Caffeine consumption the amount of caffeine consumed in the 24 hours prior to bedtime (in mg)
-- Alcohol consumption the amount of alcohol consumed in the 24 hours prior to bedtime (in oz)
-- Smoking status whether or not the test subject smokes
-- Exercise frequency the number of times the test subject exercises each week
SELECT * FROM sleep_efficiency;
-- Q1.Find out the average sleep duration of top 15 male 
-- candidates who's sleep duration are equal to 7.5 or greater than 7.5

select avg(Sleep_duration) as 'avg_sleep_duration' from sleep_efficiency
where gender ='Male' and  Sleep_duration>= 7.5 order by Sleep_duration
desc limit 15

-- Q2.Show avg deep sleep time for both gender. Round result at 2 decimal places.
-- Note: sleep time and deep sleep percentage will give you, deep sleep time.

-- Problem 3:
-- The question is:

-- Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage values are 
-- between 25 to 45. Display age, light sleep percentage and deep sleep percentage columns only.

-- Problem 4: Group by on exercise frequency and smoking status and show average deep sleep time, 
-- average light sleep time and avg rem sleep time.
-- Note the differences in deep sleep time for smoking and non smoking status
-- Problem 5: Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol 
-- consumption only for people who do exercise atleast 3 days a week. Show result in descending order awekenings



-- SESSION NUMBER 35 SUBQUERY
-- Q1.Find the movie with highest rating
select max(score) from movies

select * from movies 
where score=9.3

select*from movies
where score=(select max(score) from movies)

-- 	Q2. find the movie with heighest profit
select * from movies where (gross-budget)=( select max(gross-budget) from movies )

select * from movies order by (gross-budget) desc limit 1

-- Q3.Find how many movies having a rating > the average of all the movie rating
select avg(score) from movies

select count(*) from movies 
where score >(select avg(score) from movies)

-- Q4.find the height rated movie of 2000
select * from movies where year=2000 and score= (select max(score) from movies where year=2000 )

select max(score) from movies where year=2000 
-- INDEPENDENT SUBQUERY 2ND TYPE
-- Q1.FIND ALL USERS WHO NEVER ORDERED
select * from users
where user_id not in (SELECT distinct (user_id) FROM session_32.`orders zom`)
-- Q2.FIND ALL THE MOVIES MADE  BY TOP 3 DIRECTORS IN TERMS OF TOTAL GROSS INCOME

select * from movies 
where director in (SELECT director  from movies
group by director
order by sum(gross) desc )

SELECT director  from movies
group by director
order by sum(gross) desc limit 3

with top_director as (SELECT director  from movies
group by director
order by sum(gross) desc limit 3)
select * from movies where director in (select * from top_director)

 -- window functions sessions 36
 
 create database window_sessions
 use window_sessions ;
 CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51)

-- window function query
select * , avg(marks) over (partition by branch) as avg_marks
from marks order by student_id

select *,min(marks) over() , max(marks) over()
from marks order by student_id

-- 1. Find all the students who have marks higher than the avg marks of  their respective branch

select * , avg(marks) over (partition by branch) as 'branch_avg'
from marks

select * from ( select * , avg(marks) over (partition by branch) as 'branch_avg'
from marks ) t
where t.marks > t.branch_avg

SELECT * , rank() over(order by marks desc) from marks

SELECT * , rank() over(partition by branch order by marks desc) ,
dense_rank() over (partition by branch order by marks desc)
from marks

select *, row_number() over (partition by branch) 
from marks

select *, first_value(name) over(order by marks desc)
from marks 



select *, last_value(name) over(partition by branch order by marks desc ROWS BETWEEN UNBOUNDED PRECEDING  AND UNBOUNDED FOLLOWING )
from marks 

select *, nth_value(name,2) over(partition by branch order by marks desc ROWS BETWEEN UNBOUNDED PRECEDING  AND UNBOUNDED FOLLOWING )
from marks 

select name , branch , marks from (select * , 
first_value(name) over (partition by branch order by marks desc ) as 'topper_name',
first_value(marks) over (partition by branch order by marks desc ) as 'topper_marks '
from marks ) t
where t.name=t.topper_name 