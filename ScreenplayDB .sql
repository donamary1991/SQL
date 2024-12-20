-- movies
use june_ds1;
show tables;

select * from movies_cleaned_pandas;
-- 1. Find row count
select count(*) from movies_cleaned_pandas;
-- 2. Remove duplicates and find row count

select distinct count(*) from movies_cleaned_pandas;
-- 3. Sort data set by release year in des order
select * from movies_cleaned_pandas order by year desc;

-- 4. Find rating mxm 5 movies name,year,rating
select * from movies_cleaned_pandas order by rating desc limit 5;
-- 5. Find rating minimum 3 movies name,year,rtaing
select * from movies_cleaned_pandas order by rating asc limit 5;
-- 6. Find Each year release movie count [count desc order]
select year,count(*) as release_count from movies_cleaned_pandas group by year order by release_count  desc;
-- 7. Each rating count [count desc order]
select rating,count(*) as abc from movies_cleaned_pandas group by rating order by abc desc;
-- 8. 2008 and rating above 3 [collect]
create view mov as select * from movies_cleaned_pandas where rating >3 and year=2008;
-- A. row count
select count(*) from mov;
-- 9. Find duration mxm 1 movies name,year,rating,duration
select movie,year,rating,dur from movies_cleaned_pandas order by dur desc limit 1;
-- 10. Find rating mnm 1 movies name,year,rating,duration
select movie,year,rating,dur from movies_cleaned_pandas order by rating asc limit 1;
-- 11. Rating above 4 and relase year above 2005
create view mov_rat as select * from movies_cleaned_pandas where rating >4  and year>2005;
-- A. Rating mxm movies full data
select * from mov_rat order by rating desc;
-- B. Rating mnm movies full data
select * from mov_rat order by rating asc;
-- 12. 2008 movies count
select * from movies_cleaned_pandas where year=2008;
-- 13. 1975-2000 movies collect
create view mov_year as select * from movies_cleaned_pandas where year >1975  and year<2000;
-- A. Row count
select count(*) from mov_year;
-- 14. 1975-2000 and rating above 3.5 total row count
select * from movies_cleaned_pandas where year >1975  and year<2000 and rating>3.5;
