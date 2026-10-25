-- business task: Investigate revenue per order

SELECT
	YEAR(soh.OrderDate) AS OrderYear,
	COUNT(DISTINCT sod.SalesOrderID) AS TotalOrders,
	SUM(sod.LineTotal) AS TotalRevenue,
	1.0 * SUM(sod.LineTotal)/COUNT(DISTINCT sod.SalesOrderID) AS AvgRevenuePerOrder
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
WHERE YEAR(soh.OrderDate) IN (2013, 2014)
GROUP BY YEAR(soh.OrderDate)
ORDER BY OrderYear;
