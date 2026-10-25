
# AdventureWorks Sales Analysis

## Project Overview
This project analyzes sales data from the AdventureWorks sample database using Microsoft SQL Server and T-SQL.

The objective is to explore product performance, sales trends over time, sales territory performance, and customer revenue contribution.

## Business Questions
1. Which products generate the highest revenue?
2. Which products sell the most units?
3. How does revenue change from year to year?
4. Which sales territories generate the most revenue?
5. Which customers contribute the most revenue?

## Tools Used
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL

## SQL Techniques
- Aggregate Functions
- JOINs
- GROUP BY
- ORDER BY
- TOP
- CTEs
- Window Functions (LAG, ROW_NUMBER)
- Conditional Aggregation
- Percent Change Calculations

## Key Findings

1. **Product revenue:** Mountain-200 Black, 38 generated the highest product revenue, totaling 4,400,592.80.
2. **Sales volume:** AWC Logo Cap was the highest-selling product by quantity, with 8,311 units sold.
3. **Annual performance:** 2013 recorded the highest annual revenue at 43,622,479.05.
4. **Territory performance:** Southwest generated the highest territory revenue, totaling 24,184,609.60.
5. **Customer performance:** Brakes and Gears was the highest-revenue customer, generating 877,107.19.

### Investigation of the 2014 Revenue Decline

A comparison of 2013 and 2014 revealed that total revenue declined from 43.62 million to 20.06 million, a decrease of approximately 54.02%.

During the same period, the number of orders fell from 14,182 to 11,761, a decrease of approximately 17.07%. Average revenue per order also declined from approximately 3,075.90 to 1,705.46, a decrease of approximately 44.56%.

These results indicate that the revenue decline coincided with both lower order volume and lower average revenue per order. Further analysis of product mix, order quantities, and pricing would be needed to investigate the underlying causes.


## Business Recommendations

1. **Review high-revenue products:** Investigate the sales drivers behind the Mountain-200 Black, 38, and assess whether similar product variants have comparable performance.
2. **Evaluate high-volume products:** Investigate the demand for AWC Logo Cap and consider whether its sales volume creates opportunities for cross-selling or bundling.
3. **Investigate annual trends:** Compare revenue across years and examine year-over-year changes to understand the factors behind the 2013 peak.
4. **Study territory performance:** Examine Southwest's product mix, customer base, and order patterns to identify practices that may be useful in other territories.
5. **Review key customer relationships:** Analyze Brakes and Gears' purchasing frequency and product mix to identify opportunities to strengthen the relationship.

## Data Validation

Total revenue from sales-detail records was reconciled against the sum of annual revenue figures. The totals matched, supporting the consistency of the annual revenue calculation.

