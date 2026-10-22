-- Which sales territories generate the most revenue?

SELECT 
	soh.TerritoryID,
	st.Name,
	SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st
ON soh.TerritoryID = st.TerritoryID
JOIN Sales.SalesOrderDetail AS sod
ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY 
soh.TerritoryID,
st.Name
ORDER BY TotalRevenue DESC;
