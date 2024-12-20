create database june_ds;
show databases;
use june_ds;
create table employee(id int,fname varchar(30),lname varchar(30),age int,prof varchar(30),salary bigint);
insert into employee(id,fname,lname,age,prof,salary) values(101,'dona','george','30','senior_engineer','40000'),(102,'sona','geo','30','senior_engineer','40000'),(103,'nathy','majo','30','senior_engineer','40000'),(104,'ram','vasu','30','senior_engineer','40000'),(105,'mathu','rao','30','senior_engineer','40000');
select * from employee;
SET SQL_SAFE_UPDATES=0;
update employee set fname='seetha' where id=102;
select * from employee;
create database june_ds1;
use june_ds1;
show tables;
select * from sample41;
select fname from sample41 where loc='Chennai';
select fname,lname,age,phno from sample41;
-- limit==>selection of rows
select * from sample41 limit 5;
select fname,lname,age,phno from sample41 limit 3;
select * from customer1;
select fname,lname,age,prof from customer1 limit 25;
-- where for condition (>,<,>=,<=,=,!=)
select fname,lname,age,prof from customer1 where prof='Teacher';
select * from sample41 where age>23;
select fname,lname,age,phno from sample41 where age=21;
select fname,lname,age from sample41 where loc='Chennai';
-- multiple conditions:'and' ,'or' keyword
select fname,lname,age,phno from sample41 where loc='Chennai' and age>23;
-- sort==>order by 
-- select * from sample41 order by colname asc;
-- select * from sample41 order by colname desc;
select * from sample41 order by age desc;
select * from sample41 order by age asc;
show databases;
use june_ds1;
show tables;
select * from customer1;
-- hierarchy==colmn where order by limit
-- age maximum 2 employees fname,lname,age,phno 
select fname,lname age,phno from sample41 order by age desc limit 2;
-- age min  employees fname,lname,age,phno 
select fname,lname age,phno from sample41 order by age asc limit 1;
-- loc==Chennai max age1 
select fname,lname,age,phno from sample41 where loc='Chennai' order by age desc limit 1; 
-- customer1 
select * from customer1;
#2. india work fname,lname,age,prof
select fname,lname,age,prof from customer1 where loc='india'; 

#3. Age mxm 5 employee fname,lname,age,prof
select fname,lname age,prof from customer1 order by age desc limit 5;

#4. Age min 3 employee fname,lname,age,prof
select fname,lname age,prof from customer1 order by age asc limit 1;

#5. uk work fname,lname,age
select fname,lname,age from customer1 where loc='uk'; 

#6. Age range 40 to 60 fname,lname,age,prof
select fname,lname,age,prof from customer1 where age>=40 and age<= 60; 

#7. india work, age mxm 2e emp fname,lname,age
select fname,lname,age from customer1 where loc='india' order by age limit 2 ;

#8. india work and prof Doctor fname,lname,age
select fname,lname,age from customer1 where loc='india' and prof='Doctor';

#9. Pilot prof, age min 1 employee fname,lname,age
select fname,lname,age from customer1 where prof='Pilot' order by age asc limit 1;

#10. Actor,age mxm 2 employee,fname,lname,age
select fname,lname,age from customer1 where prof='Actor' order by age desc limit 2;
-- where prof='A.*' profession starting with A


-- results can be stored as tables .those Tables are called as view table
-- the result can be seen as table it can be viewd using query 'show tables'

-- create view viewtblename as (query);
-- query for creating a table that satisfies the condition  

-- uk work and age above 50 fname lname age prof 
create view uk_age50 as select fname,lname,age,prof from customer1 where loc='uk' and age>=50;
show tables;
select * from uk_age50;

-- india workage min 3 emp fname lname age prof  
create view india_age as select fname,lname,age,prof from customer1 order by age asc limit 3;
show tables;
select * from india_age;

-- drop view table
-- drop view tablname  
-- drop view india_age;


-- how to drop duplicates rows 
-- distinct() 
-- select distinct * from tblname;


-- interview qn:
-- difference between drop and truncate
-- drop ==complete table will be terminated
-- truncate ==complete values in the table will be removed but the schema remains which is columns remains   
-- drop table tblname;
-- truncate table tblname;
use june_ds1;
show tables;


-- evaluating functions

-- count()
-- max()
-- min()
-- avg()
-- sum()

-- count() 
-- purpose
-- 1.Total row count()
-- 2.total column count()

-- 1.total row count
-- select count (*)


 from tblname;   
select count(*) from customer1; 
-- 2.column wise count--group by function-- grouping col and selecting col should be same
-- select colname,count(*) from tblname group by colname;
select prof,count(*) from customer1 group by prof;
# find each location count
select loc, count(*) from sample41 group by loc;


# customer1

# hierarchy ===> select count where group order limit

# find each prof count
select prof, count(*) from customer1 group by prof;


# to find each prof count desc order
# how to pass name to count column(here we pass the name abc and order by abc in desc order)
select prof, count(*) as abc from customer1 group by prof order by abc desc;


# each country count in desc order
select loc, count(*) as abc from customer1 group by loc order by abc desc;


# india work each prof count ===> store
create view indiaa as select prof, count(*) as abc from customer1 where loc='India' group by prof;
select * from indiaa;


# age above 50 each prof count ==> desc order
select prof, count(*) as abc from customer1 where age>50 group by prof order by abc desc;



# ===> next evaluating function is: max()

# max() is used to find the max value of a column corresponding to another column

#select colname, max(col_name) from tblname group by colname; # both select cheyunna colname and group cheyunna colname are same

# each prof maximum age
select prof, max(age) from customer1 group by prof;

# each prof maximum age order by age desc
select prof, max(age) as abc from customer1 group by prof order by abc desc;

#temperature

show tables;
select * from temperature;

# each year max temperature
select year, max(temp) from Temperature_windows group by year;


# ===> next evaluating function is: max()

# min() is used to find the min value of a column corresponding to another column

# each year min temperature
select year, min(temp) from Temperature_windows group by year;

-- sum()
-- select colname,sum(colname) from tblname group by colname
select year,sum(temp) from Temperature_windows group by year;   

-- Avg
-- select colname,avg(colname) from tblname group by colname;
-- year avg temp
select year,avg(temp) from Temperature_windows group by year; 
-- join Operation 
-- 1.inner joining
-- 2.left outer joining
-- 3.right outer joining
-- 4.full outer joining

-- 1.inner joining  common field match data==b/w 2 tables
-- table reference is required
-- table 1==>id,fname,lname,age  ref==>a
-- table 2==>prof,loc, id,salary ref==>b
-- fname,lname,age,prof,salary 
-- select a.fname,a.lname,a.age,b.prof,b.salary from table1 a join table2 b on(a.id=b.id);


 



