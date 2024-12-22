
use june_ds1;
-- 1. each prof count [count desc]
select prof,count(*) as abc from customer5 group by prof order by abc desc;
-- each prof total salary [salary desc] 
select prof,sum(salary) as abc from customer5 group by prof order by abc desc;
--  each prof max salary [salary desc]
select prof,max(salary) as abc from customer5 group by prof order by abc desc;
-- each loc min salary
select loc,min(salary) as abc from customer5 group by loc;
-- each prof average age 
select prof,avg(age) as abc from customer5 group by prof order by abc desc;
