-- business task: Find the top five products for each year
-- business question: Which five products generated the most revenue in 2013, and which five generated the most revenue in 2014?

WITH RevenueRankByYear AS (
	SELECT
	p.ProductID AS ProductID,
	p.Name AS Name,
	YEAR(soh.OrderDate) AS OrderYear,
	SUM(sod.LineTotal) AS TotalRevenue,
	ROW_NUMBER() OVER(PARTITION BY YEAR(soh.OrderDate) ORDER BY SUM(sod.LineTotal) DESC) AS RevenueRank
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p
ON sod.ProductID = p.ProductID
JOIN Sales.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
WHERE YEAR(soh.OrderDate) IN (2013, 2014)
GROUP BY p.ProductID, p.Name,YEAR(soh.OrderDate)

)

SELECT
	ProductID,
	Name,
	OrderYear,
	TotalRevenue,
	RevenueRank
FROM RevenueRankByYear
WHERE RevenueRank <=5
ORDER BY OrderYear, RevenueRank
