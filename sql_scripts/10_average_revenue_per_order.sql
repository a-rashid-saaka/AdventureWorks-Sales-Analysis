-- business task: Average revenue per order by territory
-- Business question: How did average revenue per order change between 2013 and 2014 in each territory?

WITH TerritoryRevenueSummary AS (
	SELECT 
		st.Name AS Name,
		SUM(CASE
			WHEN YEAR(soh.OrderDate) = 2013 THEN sod.LineTotal
			ELSE 0
		END) AS Revenue13,
		SUM(CASE
			WHEN YEAR(soh.OrderDate) = 2014 THEN sod.LineTotal
			ELSE 0
		END) AS Revenue14,
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
TerritoryRevenueChanges AS (
SELECT
  Name,
  Revenue13,
  Revenue14,
  Order13,
  Order14,
  1.0 * Revenue13/NULLIF(Order13,0) AS AvgRevenue13,
  1.0 * Revenue14/NULLIF(Order14,0) AS AvgRevenue14,
  (1.0 * Revenue14/NULLIF(Order14,0)) - (1.0 * Revenue13/NULLIF(Order13,0))  AS AvgRevenueChange,
  ((1.0 * Revenue14/NULLIF(Order14,0)) - (1.0 * Revenue13/NULLIF(Order13,0))) * 100.0 /NULLIF((1.0 * Revenue13/NULLIF(Order13,0)), 0) AS AvgRevenueChangePercent
FROM TerritoryRevenueSummary;
)


SELECT 
	Name,
	Revenue13,
	Revenue14,
	Order13,
	Order14,
	AvgRevenue13,
	AvgRevenue14,
	AvgRevenueChange,
	AvgRevenueChangePercent
FROM TerritoryRevenueChanges
ORDER BY AvgRevenueChangePercent;
