-- business question: Did the average number of units sold per order decline between 2013 and 2014 in each territory?

WITH TerritoryQuantitySummary AS (
	SELECT 
		st.Name AS Name,
		SUM(CASE
			WHEN YEAR(soh.OrderDate) = 2013 THEN sod.OrderQty
			ELSE 0
		END) AS Qty13,
		SUM(CASE
			WHEN YEAR(soh.OrderDate) = 2014 THEN sod.OrderQty
			ELSE 0
		END) AS Qty14,
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
),
TerritoryQuantityChanges AS (
SELECT
	Name,
	Qty13,
	Qty14,
	Order13,
	Order14,
	1.0 * Qty13/NULLIF(Order13,0) AS AvgQty13,
	1.0 * Qty14/NULLIF(Order14,0) AS AvgQty14,
	(1.0 * Qty14/NULLIF(Order14,0)) - (1.0 * Qty13/NULLIF(Order13,0)) AS AvgQtyChange,
	((1.0 * Qty14/NULLIF(Order14,0)) - (1.0 * Qty13/NULLIF(Order13,0))) * 100.0/NULLIF((1.0 * Qty13/NULLIF(Order13,0)),0) AS AvgQtyChangePercent
FROM TerritoryQuantitySummary
)

SELECT
	Name,
	Qty13,
	Qty14,
	Order13,
	Order14,
	AvgQty13,
	AvgQty14,
	AvgQtyChange,
	AvgQtyChangePercent
FROM TerritoryQuantityChanges
ORDER BY AvgQtyChangePercent
