-- business task: Was the decline consistent across territories?
-- business question: Compare total revenue in 2013 and 2014 for each sales territory, and calculate the percentage change.

WITH RevenueByTerritory AS (
	SELECT 
		st.Name AS Name,
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
	JOIN Sales.SalesTerritory AS st
	ON soh.TerritoryID = st.TerritoryID
	WHERE YEAR(soh.OrderDate) IN (2013, 2014)
	GROUP BY st.Name
)

SELECT 
	Name,
	Revenue13,
	Revenue14,
	Revenue14 - Revenue13 AS RevenueChange,
	(Revenue14 - Revenue13) * 100.0/NULLIF(Revenue13, 0) AS PercentChange
FROM RevenueByTerritory
ORDER BY RevenueChange



-- business task: Order count by territory
-- business question: Did the territories with the steepest revenue declines also experience the steepest declines in order counts between 2013 and 2014?

WITH OrderByTerritory AS (
	SELECT 
		st.Name AS Name,
		COUNT(DISTINCT CASE
			WHEN YEAR(soh.OrderDate) = 2013 THEN sod.SalesOrderID
		END) AS Order13,
		COUNT(DISTINCT CASE
			WHEN YEAR(soh.OrderDate) = 2014 THEN sod.SalesOrderID
				END) AS Order14

	FROM Sales.SalesOrderDetail AS sod
	JOIN Sales.SalesOrderHeader AS soh
	ON sod.SalesOrderID = soh.SalesOrderID
	JOIN Sales.SalesTerritory AS st
	ON soh.TerritoryID = st.TerritoryID
	WHERE YEAR(soh.OrderDate) IN (2013, 2014)
	GROUP BY st.Name
)


SELECT 
Name,
Order13,
Order14,
Order14 - Order13 AS OrderChange,
(Order14 - Order13) * 100.0 /NULLIF(Order13,0) AS PercentChange
FROM OrderByTerritory
ORDER BY PercentChange;
