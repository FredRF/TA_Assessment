/*--------------------------------------
--  Author: Frederico Rivera Ferreira (frerferreira@gmail.com)
--  Homework Test from TripAdvisor
--------------------------------------*/

/* Question 1.1 */
SELECT YEAR, COUNT(CUSTOMER) AS CountOfDistinctCustomers
FROM (
		SELECT YEAR, CUSTOMER
		FROM table_1_1
		GROUP BY YEAR, CUSTOMER
		) AS t
GROUP BY YEAR
ORDER BY YEAR;

/* Question 1.2 */
SELECT
c.YEAR,
c.QUARTER,
c.MONTH,
c.Curr_To_Date AS "Current Year Quarter To Date Booking Revenue",
SUM(d.BOOKING_REVENUE) AS "Last Year Quarter To Date Booking Revenue"
FROM (
	SELECT
	a.YEAR,
	a.QUARTER,
	a.MONTH,
	SUM(b.BOOKING_REVENUE) AS Curr_To_Date
	FROM table_1_3 AS a
	LEFT JOIN table_1_3 AS b ON a.YEAR = b.YEAR AND a.MONTH >= b.MONTH AND a.QUARTER = b.QUARTER
	GROUP BY a.YEAR, a.QUARTER, a.MONTH
	) AS c
LEFT JOIN table_1_3 AS d ON (c.YEAR-1) = d.YEAR AND c.MONTH >= d.MONTH AND c.QUARTER = d.QUARTER
GROUP BY c.YEAR, c.QUARTER, c.MONTH
ORDER BY c.YEAR, c.MONTH;

/* Question 1.3 */
SELECT
QUARTER,
SUM(CASE WHEN YEAR=2005 THEN BOOKING_REVENUE ELSE 0 END) AS "2005 Bookings",
SUM(CASE WHEN YEAR=2006 THEN BOOKING_REVENUE ELSE 0 END) AS "2006 Bookings",
SUM(CASE WHEN YEAR=2007 THEN BOOKING_REVENUE ELSE 0 END) AS "2007 Bookings"
FROM table_1_3 AS t
GROUP BY QUARTER;

/* Question 2.1 */
SELECT 
t3.QUARTER,
t3.PRODUCT,
t3.PARTNER,
t3.LIST_PRICE,
(t3.LIST_PRICE * 
	(CASE 
		WHEN FAMILY = "LOW END" THEN (1 - (t26.LOW_END/100))
		WHEN FAMILY = "MID RANGE" THEN (1 - (t26.MID_RANGE/100))
		WHEN FAMILY = "HIGH END" THEN (1 - (t26.HIGH_END/100))
		ELSE 0
	END)) AS NET_PRICE
FROM (
	SELECT t2.*, t25.TIER
	FROM (
		SELECT 
		t1.*, 
		t24.PARTNER_ID
		FROM (
			SELECT t.*, prods.FAMILY, prods.CLASS
			FROM table_2_1 as t
			LEFT JOIN (
				SELECT t22.*, t23.CLASS
				FROM table_2_2 AS t22 
				LEFT JOIN table_2_3 AS t23 
				ON t22.FAMILY = t23.FAMILY
			) AS prods
			ON t.PRODUCT = prods.PRODUCT
		) AS t1
		LEFT JOIN table_2_4 AS t24 ON t1.PARTNER = t24.PARTNER
	) AS t2
	LEFT JOIN table_2_5 AS t25 ON t2.PARTNER_ID = t25.PARTNER_ID AND t2.CLASS = t25.CLASS
) AS t3
LEFT JOIN table_2_6 AS t26 ON t3.TIER = t26.TIER
ORDER BY t3.QUARTER, t3.PRODUCT;

/* Question 2.2 */
CREATE TABLE IF NOT EXISTS aux_weekdays (
	WEEKDAY CHAR(255),
	DATE DATE UNIQUE
);

INSERT INTO aux_weekdays (WEEKDAY, DATE) VALUES 
('tuesday','2016-1-5'), ('tuesday','2016-1-12'), ('tuesday','2016-1-19'), ('tuesday','2016-1-26'), ('tuesday','2016-2-2'), ('tuesday','2016-2-9'), ('tuesday','2016-2-16'),
('tuesday','2016-2-23'), ('tuesday','2016-3-1'), ('tuesday','2016-3-8'), ('tuesday','2016-3-15'), ('tuesday','2016-3-22'), ('tuesday','2016-3-29'), ('tuesday','2016-4-5'),
('tuesday','2016-4-12'), ('tuesday','2016-4-19'), ('tuesday','2016-4-26'), ('tuesday','2016-5-3'), ('tuesday','2016-5-10'), ('tuesday','2016-5-17'), ('tuesday','2016-5-24'),
('tuesday','2016-5-31'), ('tuesday','2016-6-7'), ('tuesday','2016-6-14'), ('tuesday','2016-6-21'), ('tuesday','2016-6-28'), ('tuesday','2016-7-5'), ('tuesday','2016-7-12'),
('tuesday','2016-7-19'), ('tuesday','2016-7-26'), ('tuesday','2016-8-2'), ('tuesday','2016-8-9'), ('tuesday','2016-8-16'), ('tuesday','2016-8-23'), ('tuesday','2016-8-30'),
('tuesday','2016-9-6'), ('tuesday','2016-9-13'), ('tuesday','2016-9-20'), ('tuesday','2016-9-27'), ('tuesday','2016-10-4'), ('tuesday','2016-10-11'), ('tuesday','2016-10-18'),
('tuesday','2016-10-25'), ('tuesday','2016-11-1'), ('tuesday','2016-11-8'), ('tuesday','2016-11-15'), ('tuesday','2016-11-22'), ('tuesday','2016-11-29'), ('tuesday','2016-12-6'),
('tuesday','2016-12-13'), ('tuesday','2016-12-20');

SELECT t1.DATE, COUNT(t1.TEST_NAME) AS "number_of_active_test"
FROM (
	SELECT t.*, td.DATE
	FROM table_2_8 AS t
	LEFT JOIN aux_weekdays AS td ON t.START_DATE <= td.DATE AND t.END_DATE >= td.DATE AND td.WEEKDAY = "tuesday"
) AS t1
WHERE t1.DATE IS NOT NULL
GROUP BY t1.DATE
ORDER BY t1.DATE;

/* Question 2.3 */
CREATE TABLE Customer_Master_Best_Guess_DUNS_Numbers
	SELECT 
	t.CUSTOMER_SITE_ID,
	t.PARENT_CUSTOMER,
	t.CITY,
	t.STATE,
	t.COUNTRY,
	(CASE 
		WHEN t.DUNS IS NOT NULL THEN t.DUNS
		WHEN city.DUNS IS NOT NULL THEN city.DUNS
		WHEN state.DUNS IS NOT NULL THEN state.DUNS
		WHEN country.DUNS IS NOT NULL THEN country.DUNS
		ELSE NULL
	END) AS DUNS
	FROM table_2_10 AS t
	LEFT JOIN table_2_10 AS city ON t.CITY = city.CITY
	LEFT JOIN table_2_10 AS state ON t.STATE = state.STATE
	LEFT JOIN table_2_10 AS country ON t.COUNTRY = country.COUNTRY
	GROUP BY t.CUSTOMER_SITE_ID, t.PARENT_CUSTOMER, t.CITY, t.STATE, t.COUNTRY;
