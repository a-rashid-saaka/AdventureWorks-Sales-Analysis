-- How has sales revenue changed over time?

SELECT 
	YEAR(soh.OrderDate) AS OrderYear,
	SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY YEAR(soh.OrderDate)
ORDER BY OrderYear;
