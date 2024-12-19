-- initial phase 
 
create database pizzahut;

use pizzahut;

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);



CREATE TABLE order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);

CREATE TABLE pizzatypes (
    pizza_type_id TEXT NOT NULL,
    pizza_name TEXT NOT NULL,
    category TEXT NOT NULL,
    ingredients TEXT NOT NULL
);


-- Basic:
-- 1.Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;

-- 2.Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON (order_details.pizza_id = pizzas.pizza_id);

-- 3.Identify the highest-priced pizza.
SELECT 
    pizzatypes.pizza_name, pizzas.price
FROM
    pizzas
        JOIN
    pizzatypes ON pizzas.pizza_type_id = pizzatypes.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- 4.Identify the most common pizza size ordered.
SELECT 
    pizzas.size, sum(order_details.quantity) AS order_size
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_size DESC;

-- 5.List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizzatypes.pizza_name,
    SUM(order_details.quantity) AS count_types
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizzatypes ON pizzas.pizza_type_id = pizzatypes.pizza_type_id
GROUP BY pizzatypes.pizza_name
ORDER BY count_types DESC
LIMIT 5;

-- Intermediate:
-- 1.Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizzatypes.category,
    SUM(order_details.quantity) AS total_quatity
FROM
    pizzatypes
        JOIN
    pizzas ON pizzatypes.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details
GROUP BY pizzatypes.category
ORDER BY total_quatity DESC;

-- 2.Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);

-- 3. Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(pizza_name) AS category_count
FROM
    pizzatypes
GROUP BY category;
-- 4. Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity), 0) as avg_pizza
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON order_details.order_id = orders.order_id
    GROUP BY order_date) AS order_avg;
-- 5.Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizzatypes.pizza_name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizzas
        JOIN
    pizzatypes ON pizzatypes.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzatypes.pizza_name 
ORDER BY revenue DESC
LIMIT 3;


-- Advanced:
-- 1.Calculate the percentage contribution of each pizza type to total revenue.
SELECT pizzatypes.category,
    ROUND(SUM(order_details.quantity * pizzas.price)/ (SELECT 
            ROUND(SUM(order_details.quantity * pizzas.price),
                        2) AS total_revenue
        FROM
            order_details
                JOIN
            pizzas ON (order_details.pizza_id = pizzas.pizza_id))* 100,2) as Contribution_each_pizza
FROM
    pizzatypes
        JOIN pizzas
     ON pizzatypes.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzatypes.category;
-- 2. Analyze the cumulative revenue generated over time.
   --   cumulative
-- 200		200
-- 300		500 	
-- 500		1000
-- 600		1600
select order_date,sum(revenue_date) over (order by order_date) as cum_revenue from
(SELECT 
    orders.order_date,
    SUM(order_details.quantity * pizzas.price) as revenue_date
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    orders ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) as sales ;
-- 3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category,pizza_name,revenue from (select category,pizza_name,revenue,rank() over(partition by category order by revenue desc) as ranks from
(SELECT 
    pizzatypes.category,
    pizzatypes.pizza_name,
    SUM(pizzas.price * order_details.quantity) as revenue
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    pizzatypes ON pizzatypes.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizzatypes.category , pizzatypes.pizza_name) as a )as b where ranks<=3;
