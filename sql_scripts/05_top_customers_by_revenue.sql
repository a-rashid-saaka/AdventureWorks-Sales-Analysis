-- Who are the top 10 customers by total revenue?

SELECT TOP 10
	c.CustomerID,
	s.Name,
	SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
JOIN Sales.Customer AS c
ON soh.CustomerID = c.CustomerID
JOIN Sales.Store AS s
ON c.StoreID = s.BusinessEntityID
GROUP BY c.CustomerID, s.Name
ORDER BY TotalRevenue DESC;
