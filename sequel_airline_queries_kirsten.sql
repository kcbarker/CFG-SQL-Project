USE sequel_airline;

SELECT * FROM customers;
SELECT * FROM airports;
SELECT * FROM aircraft;
SELECT * FROM routes;
SELECT * FROM flights;
SELECT * FROM bookings;

-- using views 

SELECT * FROM flight_details; -- shows flight duration, price and destination - grouped by destination, ordered by price

SELECT * FROM above_average_price; -- shows flights with prices that are higher than the average price 

SELECT * FROM longest_flight_each_day; -- shows flights with longest duration each day of the week 

SELECT * FROM most_popular_flights; -- shows top 10 most popular destination based on booking numbers 

SELECT * FROM number_of_flights_per_destination; -- shows number of flights available per destination 

-- stored procedure to show number of flights per day 

CALL flights_per_day;

-- stored function to categorise price paid by customers as low, medium or high 

SELECT booking_id, price_category(price)
FROM bookings;

-- testing trigger - customer age must be over 18 -- will generate error to say customer must be older than 18 

INSERT INTO customers (first_name, last_name, age) 
VALUES 
('Jeff', 'Smith', 17);

-- other queries/used for visualisations 

-- show the top 10 customers that have spent the most 

SELECT customer_id, sum(price) AS total_amount_spent 
FROM bookings
GROUP BY customer_id
ORDER BY sum(price) DESC
LIMIT 10; 


-- select frequent flyer status 

SELECT customer_id, frequent_flyer_status(customer_id)
FROM customers;









