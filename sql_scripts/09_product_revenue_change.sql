-- business task: Measure the product's revenue decline
-- business question: How did revenue change for each product from 2013 to 2014, in both absolute terms and percentage terms?
WITH RevenueByDate AS (
	SELECT 
		p.ProductID AS ProductID,
		p.Name AS Name,
		SUM(CASE
			WHEN YEAR(soh.OrderDate) = 2013 THEN sod.LineTotal
			ELSE 0
		END) AS Revenue13,
		SUM(CASE
			WHEN YEAR(soh.OrderDate) = 2014 THEN sod.LineTotal
			ELSE 0
		END) AS Revenue14

	FROM Sales.SalesOrderDetail AS sod
	JOIN Sales.SalesOrderHeader AS soh
	ON sod.SalesOrderID = soh.SalesOrderID
	JOIN Production.Product AS p
	ON sod.ProductID = p.ProductID
	WHERE YEAR(soh.OrderDate) IN (2013, 2014)
	GROUP BY p.Name, p.ProductID
)


SELECT TOP 5
	Name,
	Revenue13,
	Revenue14,
	Revenue14 - Revenue13 AS RevenueChange,
	(Revenue14 - Revenue13) * 100.0/NULLIF(Revenue13,0) AS PercentChange
FROM RevenueByDate
WHERE Revenue13 <> 0 AND Revenue14 <> 0
ORDER BY RevenueChange;
