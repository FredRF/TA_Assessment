/*--------------------------------------
--  Author: Frederico Rivera Ferreira
--  Homework Test from TripAdvisor
--------------------------------------*/

-- Create Base Tables

CREATE TABLE Table_1_1 (
	YEAR SMALLINT UNSIGNED,
	CUSTOMER CHAR(255)
);

INSERT INTO Table_1_1 (YEAR, CUSTOMER) VALUES	
	(2005, 'ABC Company'),
	(2005, 'ABC Company'),
	(2005, 'XYZ Company'),
	(2006, 'XYZ Company');


CREATE TABLE Table_1_3 (
	YEAR SMALLINT UNSIGNED,
	QUARTER CHAR(2),
	MONTH TINYINT,
	BOOKING_REVENUE INTEGER
);

INSERT INTO Table_1_3 (YEAR, QUARTER, MONTH, BOOKING_REVENUE)  VALUES
	(2005, 'Q1', 1, 13),
	(2006, 'Q1', 1, 10),
	(2006, 'Q1', 2, 15),
	(2006, 'Q1', 3, 35),
	(2006, 'Q2', 4, 11),
	(2006, 'Q2', 5, 15),
	(2006, 'Q2', 6, 9),
	(2007, 'Q1', 1, 6),
	(2007, 'Q1', 2, 14),
	(2007, 'Q1', 3, 7),
	(2007, 'Q2', 4, 20),
	(2007, 'Q2', 5, 6),
	(2007, 'Q2', 6, 6);


CREATE TABLE Table_2_1 (
	QUARTER CHAR(255),
	PRODUCT CHAR(255),
	PARTNER CHAR(255),
	LIST_PRICE INTEGER UNSIGNED);

INSERT INTO Table_2_1 (QUARTER, PRODUCT, PARTNER, LIST_PRICE) VALUES
	('Q1-2006', 'A', 'Reseller XYZ', 125),
	('Q1-2006', 'B', 'Reseller PQ', 50),
	('Q1-2006', 'C', 'Reseller PQ', 60),
	('Q2-2006', 'A', 'Reseller PQ', 120),
	('Q2-2006', 'B', 'Reseller XYZ', 50),
	('Q2-2006', 'C', 'Reseller XYZ', 55);
		
CREATE TABLE Table_2_2 (
	PRODUCT CHAR(255),
	FAMILY CHAR(255));

INSERT INTO Table_2_2 (PRODUCT, FAMILY) VALUES 
	('A', 'LOW END'),
	('B', 'MID RANGE'),
	('C', 'HIGH END');

CREATE TABLE Table_2_3 (
	FAMILY CHAR(255),
	CLASS CHAR(255));

INSERT INTO Table_2_3 (FAMILY, CLASS) VALUES	
	('LOW END', 'Commodity'),
	('MID RANGE', 'Commodity'),
	('HIGH END', 'Value');

CREATE TABLE Table_2_4 (
	PARTNER_ID INTEGER NOT NULL PRIMARY KEY,
	PARTNER CHAR(255));

INSERT INTO Table_2_4 (PARTNER_ID, PARTNER) VALUES	
	(1, 'Reseller XYZ'),
	(2, 'Reseller PQ');

CREATE TABLE Table_2_5 (
	PARTNER_ID INTEGER UNSIGNED,
	CLASS CHAR(255),
	TIER TINYINT);

INSERT INTO Table_2_5 (PARTNER_ID, CLASS, TIER) VALUES 
	(1, 'Commodity', 3),
	(1, 'Value', 4),
	(2, 'Commodity', 2),
	(2, 'Value', 2);

CREATE TABLE Table_2_6 (
	TIER TINYINT,
	LOW_END TINYINT,
	MID_RANGE TINYINT,
	HIGH_END TINYINT);

INSERT INTO Table_2_6 (TIER, LOW_END, MID_RANGE, HIGH_END) VALUES	
	(1, 10, 15, 25),
	(2, 13, 18, 28),
	(3, 14, 19, 30),
	(4, 15, 21, 32);

CREATE TABLE Table_2_8 (
	ID INTEGER NOT NULL PRIMARY KEY,
	TEST_NAME CHAR(252),
	START_DATE DATE,
	END_DATE DATE
);

INSERT INTO Table_2_8 (ID, TEST_NAME, START_DATE, END_DATE) VALUES 
	(1, 'Test 1', '2016-01-01', '2016-01-10'),
	(2, 'Test 2', '2016-01-01', '2016-01-25'),
	(3, 'Test 3', '2016-01-06', '2016-01-10'),
	(4, 'Test 4', '2016-01-06', '2016-01-31'),
	(5, 'Test 5', '2016-01-11', '2016-01-25'),
	(6, 'Test 6', '2016-01-11', '2016-02-01'),
	(7, 'Test 7', '2016-01-15', '2016-01-21'),
	(8, 'Test 8', '2016-01-19', '2016-01-20'),
	(9, 'Test 9', '2016-01-19', '2016-01-22'),
	(10, 'Test 10', '2016-01-22', '2016-01-25'),
	(11, 'Test 11', '2016-01-22', '2016-01-28'),
	(12, 'Test 12', '2016-01-25', '2016-02-01'),
	(13, 'Test 13', '2016-01-28', '2016-02-01');

CREATE TABLE Table_2_10 (
	CUSTOMER_SITE_ID INTEGER NOT NULL PRIMARY KEY,
	PARENT_CUSTOMER CHAR(255),
	CITY CHAR(255),
	STATE CHAR(255),
	COUNTRY CHAR(3),
	DUNS INTEGER UNSIGNED
);

INSERT INTO Table_2_10 (CUSTOMER_SITE_ID, PARENT_CUSTOMER, CITY, STATE, COUNTRY, DUNS) VALUES 
	(1, 'GE', 'Boston', 'MA', 'USA', 123123123),
	(2, 'GE', 'Boston', 'MA', 'USA', NULL),
	(3, 'GE', 'Worcester', 'MA', 'USA', NULL),
	(4, 'GE', 'Syracuse', 'NY', 'USA', 456456456),
	(5, 'GE', 'Syracuse', 'NY', 'USA', NULL),
	(6, 'HSBC', 'London', NULL, 'UK', 789789789),
	(7, 'HSBC', NULL, NULL, 'UK', NULL);
