

show databases
use new_schema
select * from swiggy

-- Q1.How many restaurant have greater rating than 4.5
select count(distinct restaurant_name) as highest_rated_restaurant
from swiggy
where rating>4.5

-- Q2. Which is the top 1 city with highest numberof restaurnt
select city,count(distinct restaurant_name) as restaurant_count
from swiggy
group by city 
order by restaurant_count desc
limit 1 


-- Q3 How many restaurant have the word Pizza in their name
select count(distinct restaurant_name) as pizza_restaurant
from swiggy
where restaurant_name like '%Pizza%'
-- Restaurant name
select distinct restaurant_name as pizza_restaurant
from swiggy
where restaurant_name like '%Pizza%'
-- Q4 what is the most common cuisine among the restaurant in the dataset
select cuisine, count(8) as cuisine_count
from swiggy
group by cuisine
order by cuisine_count desc
limit 1


-- Q5 what is the average rating of restaurant in each city
select city, avg(rating) as avg_rating
from swiggy group by city

-- Q6 highest price of item under the recommended menu category for each restaurant

select distinct restaurant_name
menu_category,max(price) as highest_price
from swiggy where menu_category='Recommended'
group by restaurant_name,menu_category

-- Q7 find the top most expensive restaurant that offer cuisine other than indian cuisine-- 
select distinct restaurant_name,cost_per_person
from swiggy where cuisine <> 'Indian'
limit 5


-- Q8 find the restaurant that have an avaerage cost which is higher then the total avaerage cost of all restaurant together

select distinct restaurant_name,cost_per_person
from swiggy where cost_per_person>(
select avg(cost_per_person) from swiggy)

-- Q9 Retrieve the details of restaurant that have the same name but have different location

select distinct t1.restaurant_name,t1.city,t2.city
from swiggy t1 join swiggy t2
on t1.restaurant_name=t2.restaurant_name and 
t1.city <> t2.city


-- Q10 which restaurant offers the most number of items in the main coourse

select distinct restaurant_name,menu_category,
count(item) as no_of_items from swiggy
where menu_category="Main Course"
group by  restaurant_name,menu_category
order by no_of_items desc limit 1

-- Q11 list the name of restaurant that are 100% veg in alphabatical order of restaurant name
select distinct restaurant_name,
(count(case when veg_or_non_veg = 'Veg' 
then 1 end) * 100/
count (*)) as vegetarian_percentage
from swiggy 
group by restaurant_name
having vegetarian_percentage = 100.00
order by restaurant_name
select distinct restaurant_name,
(count(case when veg_or_nonveg='Veg' then 1 end)*100/
count(*)) as vegetarian_percetage
from swiggy
group by restaurant_name
having vegetarian_percetage=100.00
order by restaurant_name;
SELECT restaurant_name,
       (COUNT(CASE WHEN veg_or_nonveg = 'Veg' THEN 1 END) * 100.0 / COUNT(*)) AS vegetarian_percentage
FROM swiggy
GROUP BY restaurant_name
HAVING MAX(veg_or_nonveg) = 'Veg'
ORDER BY restaurant_name;



-- Q12  which is the restaurant providing the lowest avg price for all items
select distinct restaurant_name,
avg(price) as average_price
from swiggy group by restaurant_name
order by average_price limit 1

-- Q13 which top 5 restaurant offers highest number of categories-- 
select distinct restaurant_name,
count(distinct menu_category) as no_of_categories
from swiggy
group by restaurant_name
order by no_of_categories desc limit 5


