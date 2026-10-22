SELECT TOP 10
	p.ProductID,
	p.name AS Name, 
	SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
ON sod.ProductID = p.ProductID
GROUP BY p.name, p.ProductID
ORDER BY TotalRevenue DESC;
