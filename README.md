#### Question 1.1

Without using the ‘distinct’ function, write a query to return the result set in Table 2-2 from the values in Table 2-1.

Answer:
```SQL
SELECT YEAR, COUNT(CUSTOMER) AS CountOfDistinctCustomers
FROM (
	SELECT YEAR, CUSTOMER
	FROM table_1_1
	GROUP BY YEAR, CUSTOMER
	) AS t
GROUP BY YEAR
ORDER BY YEAR
```

#### Question 1.2

Suppose you had the fact table, Table 1-3. Construct a query to calculate the year-on-year comparison of quarter-to-date revenue as in Table 1-4.

Answer:
```SQL
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
LEFT JOIN table_1_3 AS d ON (c.YEAR - 1) = d.YEAR AND c.MONTH >= d.MONTH AND c.QUARTER = d.QUARTER
GROUP BY c.YEAR, c.QUARTER, c.MONTH
ORDER BY c.YEAR, c.MONTH
```
