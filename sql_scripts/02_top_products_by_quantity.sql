SELECT TOP 10 
	p.ProductID,
	p.Name,
	SUM(sod.OrderQty) AS UnitsSold
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
ON sod.ProductID = p.ProductID
GROUP BY P.Name,p.ProductID
ORDER BY UnitsSold DESC;
