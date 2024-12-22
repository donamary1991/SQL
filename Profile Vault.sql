-- ..................................
-- customer1
-- .................................
use june_ds1;
show tables;
select * from customer1;


-- 1. Find Row count
select count(*) from customer1;
-- 2. Remove duplicates rows and find total row count
select distinct * from customer1;
-- 3. Age maximum 10 fname,lname,prof,loc
select fname,lname,prof,loc from customer1 order by age desc limit 10;
-- 4. Age minimum 5 employees fname,lname,prof,loc
select fname,lname,prof,loc from customer1 order by age asc limit 5;
-- 5. Each location count [count desc order]
select loc,count(*) as abc from customer1 group by loc order by abc desc;
-- 6. Full data
select * from customer1 where loc='Australia';
-- 7. Each age group count [age desc order]
select age,count(*) as abc from customer1 group by age order by abc desc;
-- 8. Each profession count [count desc order]
select prof,count(*) as abc from customer1 group by prof order by abc desc;
-- 9. India work
-- A. Row count
select count(*) from customer1 where loc='India';
-- B. Each profession count [count desc order]
select prof,count(*) as abc from customer1 where loc='India' group by prof order by abc;
-- C. Age mxm 3 employees fname,lname,age,prof
select fname,lname,age,prof from customer1 where loc='India' order by age desc limit 3;
-- D. Age minimum 3 employees fname,lname,age,prof
select fname,lname,age,prof from customer1 where loc='India' order by age asc limit 3;
-- E. age above 40 full data
select * from customer1 where age>40;
-- F. age range 30 to 40 [profession count]
select prof,count(*) as abc from customer1 where age>=30 and age<=40 group by prof;
-- 10. us work
-- A. Row count
select count(*) from customer1 where loc='US';
-- B. Each age group count
select age,count(*)  from customer1  where loc='US' group by age;
-- C. Each profession count [count desc]
select prof,count(*) as abc from customer1  where loc='US' group by prof order by abc desc;
-- D. Civil engineer dept and age above 30
select * from customer1  where loc='US' and prof='Civil engineer' and age>30 ;
select * from customer1  where loc='US' and prof='Civil engineer' and age>30 ;
