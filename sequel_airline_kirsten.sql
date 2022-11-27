CREATE DATABASE Sequel_Airline;

USE Sequel_Airline;

CREATE TABLE customers (
	customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT NOT NULL, 
    PRIMARY KEY (customer_id)
);

CREATE TABLE airports (
	airport_id INT NOT NULL AUTO_INCREMENT, 
    airport_name VARCHAR(100), 
    country VARCHAR(50),
    PRIMARY KEY (airport_id) 
);

CREATE TABLE aircraft (
	aircraft_id INT NOT NULL AUTO_INCREMENT, 
    manufacturer VARCHAR (50), 
    model VARCHAR (50), 
    capacity INT,
    PRIMARY KEY (aircraft_id) 
);

CREATE TABLE routes (
	route_id INT NOT NULL AUTO_INCREMENT, 
    dept_airport INT NOT NULL, 
    arr_airport INT NOT NULL,
    PRIMARY KEY (route_id), 
    FOREIGN KEY (dept_airport) REFERENCES airports(airport_ID), 
    FOREIGN KEY (arr_airport) REFERENCES airports(airport_ID)
);

CREATE TABLE flights (
	flight_id INT NOT NULL AUTO_INCREMENT,
    aircraft_id INT NOT NULL,
    route_id INT NOT NULL,
    dept_time TIME,
    arr_time TIME, 
    duration TIME, 
    dept_day VARCHAR(9),
    PRIMARY KEY (flight_id),
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id), 
    FOREIGN KEY (route_id) REFERENCES routes(route_id) 
);

CREATE TABLE bookings (
	booking_id INT NOT NULL AUTO_INCREMENT, 
    customer_id INT NOT NULL, 
    flight_id INT NOT NULL, 
    price FLOAT(2), 
    PRIMARY KEY (booking_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES flights (flight_id)
);

INSERT INTO customers (first_name, last_name, age) 
VALUES 
('Jose', 'Wright', 50),
('Luciano', 'Garcia', 32), 
('James', 'Clarke', 18), 
('Akhil', 'Patel', 60),
('Nancy', 'Robinson', 77), 
('Michelle', 'Marshall', 55), 
('George', 'Marshall', 99), 
('Alan', 'Borowski', 37), 
('Anja', 'Kos', 25),
('Isabella', 'Ramos', 49), 
('George', 'Odeke', 62),
('Berta', 'Schneider', 31),
('Lily', 'Sanders', 26), 
('Andrea', 'Rodriguez', 22), 
('Simon', 'Chevalier', 57), 
('Hans', 'Nyberg', 43), 
('Putri', 'Namaga', 71), 
('Blakeley', 'Johnson', 56), 
('Narmada', 'Mani', 83), 
('Bowen', 'Lewis', 26), 
('Matthew', 'Barnes', 19), 
('Talia', 'Lee', 39), 
('Albert', 'Rutkowski', 47),
('Daniela', 'Mendez', 56),
('Emma', 'Li', 20), 
('Bryce', 'Norman', 65), 
('Maribel', 'Soto', 36), 
('Julia', 'Sawicka', 28), 
('Jake', 'Mulder', 78), 
('Patrick', 'Higgins', 82),
('Camilla', 'Martin', 24);


INSERT INTO airports (airport_name, country) 
VALUES 
('London Heathrow', 'England'),
('New York JFK', 'United States of America'), 
('Dubai', 'United Arab Emirates'),
('Amsterdam', 'The Netherlands'),
('Dublin', 'Republic of Ireland'),
('Frankfurt', 'Germany'),
('Madrid', 'Spain'),
('Lisbon', 'Portugal'),
('Newark', 'United States of America'),
('Geneva', 'Switzerland'),
('Athens', 'Greece'),
('Paris', 'France'),
('Boston', 'United States of America'),
('Delhi', 'India'),
('Toronto', 'Canda'),
('Toyko', 'Japan'),
('Vancouver', 'Canada'),
('Los Angeles', 'United States of America'),
('Ibiza', 'Spain'),
('Beijing', 'China');

UPDATE airports
SET airport_name = 'Tokyo' 
WHERE airport_id = 16; 

UPDATE airports
SET country = 'Canada'
WHERE airport_id = 15;

INSERT INTO aircraft (manufacturer, model, capacity)
VALUES
('Boeing', '787-8 Dreamliner', 248),
('Boeing', '787-9 Dreamliner', 296),
('Boeing', '787-10 Dreamliner', 336),
('Boeing', '747-8 Intercontinental', 410),
('Boeing', '777-300ER', 396),
('Boeing', '777-200LR', 317),
('Airbus', 'A220-100', 135),
('Airbus', 'A320neo', 180),
('Airbus', 'A330-900', 300),
('Airbus', 'A220-300', 160);


INSERT INTO routes (dept_airport, arr_airport)
VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13), 
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20);


INSERT INTO flights (aircraft_id, route_id, dept_time, arr_time, duration, dept_day)
VALUES 
(4, 4, '10:00', '11:25', '01:25', 'Wednesday'), -- flight 1 
(7, 9, '13:30', '16:15', '01:45', 'Friday'), -- flight 2 
(10, 19, '07:00', '00:40', '09:40', 'Saturday'), -- flight 3 
(3, 14, '17:00', '19:55', '07:55', 'Friday'), -- flight 4 
(8, 11, '06:00', '08:20', '01:20', 'Thursday'), -- flight 5 
(7, 6, '20:00', '23:30', '02:30', 'Monday'), -- flight 6 
(2, 16, '23:00', '00:25', '09:25', 'Friday'), -- flight 7 
(7, 18, '16:00', '19:30', '02:30', 'Saturday'), -- flight 8
(6, 7, '11:30', '14:15', '02:45', 'Tuesday'), -- flight 9 
(5, 15, '05:00', '03:40', '13:40', 'Friday'), -- flight 10 
(9, 13, '14:30', '04:45', '08:45', 'Wednesday'), -- flight 11 
(10, 17, '09:20', '12:35', '11:15', 'Sunday'), -- flight 12 
(3, 14, '10:00', '12:55', '07:55', 'Tuesday'), -- flight 13 
(1, 19, '19:00', '12:40', '09:40', 'Monday'), -- flight 14 
(7, 5, '06:15', '09:00', '01:45', 'Friday'), -- flight 15 
(8, 12, '05:20', '08:00', '07:40', 'Tuesday'), -- flight 16 
(7, 8, '12:50', '16:00', '08:10', 'Friday'), -- flight 17 
(3, 2, '06:55', '18:00', '07:05', 'Monday'), -- flight 18 
(5, 1, '14:40', '17:45', '08:05', 'Friday'), -- flight 19 
(2, 3, '13:00', '15:20', '01:20', 'Saturday'), -- flight 20 
(7, 10, '05:45', '11:30', '03:45', 'Tuesday'), -- flight 21 
(4, 17, '17:30', '20:45', '11:15', 'Friday'), -- flight 22 
(5, 12, '19:20', '22:00', '07:40', 'Saturday'), -- flight 23 
(9, 1, '08:15', '11:20', '08:05', 'Sunday'), -- flight 24 
(3, 8, '07:10', '10:20', '08:10', 'Saturday'),  -- flight 25 
(1, 17, '09:20', '12:35', '11:15', 'Friday'), -- flight 26 
(4, 11, '23:40', '02:00', '01:20', 'Monday'), -- flight 27 
(7, 16, '07:00', '08:25', '09:25', 'Friday'), -- flight 28 
(8, 14, '12:00', '14:55', '07:55', 'Saturday'), -- flight 29 
(1, 2,  '07:35', '18:40', '07:05', 'Friday'); -- flight 30 


INSERT INTO bookings (customer_id, flight_id, price)
VALUES
(1, 5, 70.00),  
(2, 10, 555.00),
(3, 29, 470.00), 
(4, 17, 755.00), 
(5, 13, 650.00), 
(6, 12, 670.00), 
(7, 4, 645.00), 
(8, 9, 67.00), 
(9, 25, 770.00), 
(10, 30, 689.00),
(11, 19, 573.00), 
(12, 23, 455.00), 
(13, 3, 625.00), 
(14, 1, 30.00), 
(15, 16, 410.00), 
(16, 29, 530.00), 
(17, 13, 735.00), 
(18, 19, 610.00), 
(19, 4, 700.00), 
(20, 13, 655.00), 
(21, 27, 75.00), 
(22, 30, 700.00), 
(23, 7, 455.00), 
(24, 8, 130.00), 
(25, 2, 89.00), 
(26, 6, 150.00), 
(27, 24, 450.00), 
(28, 22, 800.00), 
(29, 21, 200.00), 
(30, 19, 520.00), 
(31, 4, 685.00), 
(4, 27, 60.00), 
(9, 18, 520.00), 
(13, 6, 124.00), 
(3, 27, 100.00), 
(7, 9, 76.00), 
(12, 27, 83.00), 
(25, 19, 603.00), 
(4, 1, 46.00), 
(14, 27, 95.00);

-- create view to show flight duration, price and destination - grouped by destination, ordered by price

CREATE VIEW flight_details
AS 
	SELECT f.duration, b.price, a.airport_name AS destination
	FROM flights AS f 
	INNER JOIN bookings AS b -- inner join in this instance so as to eliminate those flights with null values for price (those that haven't been booked yet)
	ON f.flight_id = b.flight_id
	LEFT JOIN routes AS r
	ON f.route_id = r.route_id
	LEFT JOIN airports AS a -- joining aiports in order to get the connection to arrival airport name in the airports table 
	ON r.arr_airport = a.airport_id 
	GROUP BY destination
	ORDER BY price; 

-- view to show flights with higher than average prices 

CREATE VIEW above_average_price
AS 
	SELECT flight_id, price
	FROM bookings AS b 
	WHERE price > (
		SELECT AVG(price) AS average_flight_price 
		FROM bookings
)
	ORDER BY price DESC;

-- view to show longest flight on each day of the week 

CREATE VIEW longest_flight_each_day
AS
	SELECT dept_day, flight_id, duration
	FROM flights
	GROUP BY dept_day
	HAVING max(duration); 

-- view to show most popular flights 

CREATE VIEW most_popular_flights 
AS 
	SELECT b.flight_id, count(b.booking_id) AS number_of_bookings, a.airport_name AS destination, a.country
	FROM bookings AS b
    JOIN flights AS f 
    ON b.flight_id = f.flight_id 
    JOIN routes AS r 
	ON f.route_id = r.route_id
	JOIN airports AS a 
	ON r.arr_airport = a.airport_id
	GROUP BY destination
	ORDER BY number_of_bookings DESC
	LIMIT 10;
    
-- show top routes with the most number of flights available 

CREATE VIEW number_of_flights_per_destination
AS
	SELECT f.route_id, count(f.route_id) AS number_of_flights, a.airport_name AS destination, a.country
	FROM flights AS f
	JOIN routes AS r 
	ON f.route_id = r.route_id
	JOIN airports AS a 
	ON r.arr_airport = a.airport_id
	GROUP BY route_id
	ORDER BY number_of_flights DESC;

-- stored procedure - no of flights per day 

DELIMITER // 
DROP PROCEDURE IF EXISTS flights_per_day; 
CREATE PROCEDURE flights_per_day()
BEGIN 
	SELECT dept_day, count(dept_day) AS number_of_flights
    FROM flights
    GROUP BY dept_day
    ORDER BY dept_day;
END // 
DELIMITER ;


-- stored function -- categorise price 

DELIMITER //
DROP FUNCTION IF EXISTS price_category; 
CREATE FUNCTION price_category(
    price FLOAT 
)
RETURNS VARCHAR (10) 
DETERMINISTIC  
BEGIN 
	DECLARE price_category VARCHAR(10); 
    IF price > 500 THEN 
		SET price_category = 'HIGH'; 
	ELSEIF (price >= 200 AND price <= 500) THEN 
		SET price_category = 'MEDIUM';
	ELSEIF price < 200 THEN
		SET price_category = 'LOW';
	END IF; 
	RETURN (price_category);
END// 
DELIMITER ;

-- creating trigger so that customers making bookings must be over 18

DELIMITER // 
CREATE TRIGGER customer_age_limit
BEFORE INSERT ON customers 
FOR EACH ROW 
IF NEW.age < 18 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Customer must be older than 18';  
END IF; 
//
DELIMITER ;

-- one time event to reduce prices by 10% 

DELIMITER // 
CREATE EVENT black_friday_price_drop 
ON SCHEDULE AT '2022-11-26 00:00:00' 
DO BEGIN 
	INSERT INTO 
    bookings(price) 
    VALUES (price * 0.9); 
END // 
DELIMITER ;


-- Extra stored functions with instructor input 

-- show average number of bookings 
SELECT sum(booking_count/customer_count) 
AS average_number_of_bookings
FROM 
	(select count(*) as booking_count from bookings) as booking_table, 
    (select count(*) as customer_count from customers) as customer_table
;

-- making this a stored procedure 

DROP FUNCTION IF EXISTS average_number_of_bookings;
​
DELIMITER // 
CREATE FUNCTION average_number_of_bookings()
RETURNS DECIMAL(10, 5)
DETERMINISTIC
BEGIN
	DECLARE result DECIMAL(10, 5);
    SET result = 
	(SELECT sum(booking_count/customer_count) 
	AS average_number_of_bookings
    FROM 
		(select count(*) as booking_count from bookings) as booking_table, 
		(select count(*) as customer_count from customers) as customer_table);
	RETURN result;
END // 
DELIMITER ;

SELECT average_number_of_bookings();

-- stored function to determine if a customer is a frequent flyer 

DROP FUNCTION IF EXISTS frequent_flyer_status;
​
DELIMITER //
CREATE FUNCTION frequent_flyer_status(
    current_customer_id INT 
)
RETURNS VARCHAR (20) 
DETERMINISTIC  
BEGIN 
	DECLARE frequent_flyer_status VARCHAR(50); 
    DECLARE average_bookings INT;
    DECLARE booking_count INT;
    SET average_bookings = average_number_of_bookings();
    SET booking_count = (SELECT COUNT(booking_id) FROM bookings WHERE customer_id = current_customer_id);
    IF booking_count > average_bookings THEN 
		SET frequent_flyer_status = 'YES'; 
	ELSEIF booking_count <= average_bookings THEN 
		SET frequent_flyer_status = 'NO'; 
	END IF;
	RETURN (frequent_flyer_status);
END// 
DELIMITER ;


-- Check status
SELECT customer_id, frequent_flyer_status(customer_id)
FROM customers;