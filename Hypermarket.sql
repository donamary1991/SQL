-- txn.txt
use june_ds1;
-- ..................
-- 1. Find Row count
select count(*) as row_count from txn;
-- 2. jan month oid,cusno,category,product,state
create view jan_month as select oid,cid,category,product,state from txn where dat>='01-01-2011' and dat<='01-30-2011';
-- between keyword 
A. Row count
select * from jan_month;
select count(*) from jan_month;
-- 3. July Month oid,cusno,category,product,state
create view july_month as select oid,cid,category,product,state from txn where dat>='07-01-2011' and dat<='07-31-2011';
select * from july_month;
-- B. Row count
select count(*) from july_month;
-- 4. Each category [count desc sort]
select category,count(*) as abc from txn group by category order by abc desc;
-- 5. Category full deatils
select * from txn where category='Outdoor Recreation';
-- 6. Each paymethod count
select method,count(*) from txn group by method;
-- 7. jan-july month purchase count [include]
select product,count(*) from txn where dat>='01-01-2011' and dat<='07-31-2011' group by product;
-- 8. Each category total amount
select category,sum(amount) from txn group by category;
-- 9. Each category maximum amount
select category,max(amount) from txn group by category;
-- 10. Each category avg amount
select category,avg(amount) from txn group by category;
-- 11.total amount by cash and credit card
select method,sum(amount) from txn group by method;
-- 12. Indoor games ,total amount
select category,sum(amount) from txn where category='Indoor Games';
-- 13. Each state count
select state,count(*) from txn group by state;
