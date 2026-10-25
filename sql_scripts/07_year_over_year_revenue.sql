-- year-over-year (YoY) revenue growth

WITH AnnualRevenue AS (
SELECT 
	YEAR(soh.OrderDate) AS OrderYear,
	SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY YEAR(soh.OrderDate)
),
RevenuePreviousYear AS (
SELECT
	OrderYear,
	TotalRevenue,
	LAG(TotalRevenue) OVER(ORDER BY OrderYear) AS PreviousYearRevenue
FROM AnnualRevenue
)
SELECT 
	OrderYear,
	TotalRevenue,
	PreviousYearRevenue,
	CAST((TotalRevenue - PreviousYearRevenue) * 100
	/NULLIF(PreviousYearRevenue,0) AS DECIMAL(10,2))  AS YoYGrowthPercent
FROM RevenuePreviousYear
ORDER BY OrderYear;
