#### Question 1.1

Without using the ‘distinct’ function, write a query to return the result set in Table 2-2 from the values in Table 2-1.

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
