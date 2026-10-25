# AdventureWorks Sales Analysis

## Project Overview

This project analyzes sales data from the AdventureWorks sample database using Microsoft SQL Server and T-SQL.

The objective is to investigate product performance, annual sales trends, sales territory performance, customer revenue contribution, and changes associated with the significant revenue decline between 2013 and 2014.

The analysis progresses from descriptive reporting to diagnostic investigation to identify patterns that may help explain the decline.

## Business Questions

1. Which products generate the highest revenue?
2. Which products sell the most units?
3. How does revenue change from year to year?
4. Which sales territories generate the most revenue?
5. Which customers contribute the most revenue?
6. Which products experienced the largest revenue declines between 2013 and 2014?
7. How did order counts and average revenue per order change across sales territories?
8. How did average units per order change between 2013 and 2014?

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
- Common Table Expressions (CTEs)
- Window Functions (`LAG`, `ROW_NUMBER`)
- Conditional Aggregation using `CASE`
- Distinct Order Counting
- Percentage Change Calculations
- Division-by-Zero Handling using `NULLIF`

## SQL Scripts

The `sql_scripts/` folder contains the SQL queries used in the project.

| Script | Purpose |
|---|---|
| `00_explore_data.sql` | Explore database tables and data |
| `01_revenue_by_product.sql` | Analyze revenue by product |
| `02_top_products_by_quantity.sql` | Identify products with the highest sales quantities |
| `03_annual_revenue.sql` | Calculate annual sales revenue |
| `04_revenue_by_territory.sql` | Analyze revenue by sales territory |
| `05_top_customers_by_revenue.sql` | Identify customers generating the most revenue |
| `06_top_products_by_year.sql` | Identify the top five products by revenue in each year |
| `07_year_over_year_revenue.sql` | Analyze annual revenue changes and growth rates |
| `08_average_revenue_per_order.sql` | Analyze changes in average revenue per order between 2013 and 2014 |
| `09_product_revenue_change.sql` | Compare product revenue between 2013 and 2014 |
| `10_territory_performance_change.sql` | Compare revenue and order counts across territories |
| `11_territory_average_revenue_per_order.sql` | Analyze changes in average revenue per order across territories |
| `12_territory_average_units_per_order.sql` | Analyze changes in average units sold per order across territories |

## Key Findings

1. **Product revenue:** Mountain-200 Black, 38 generated the highest product revenue in the overall analysis, totaling approximately 4,400,592.80.
2. **Sales volume:** AWC Logo Cap was the highest-selling product by quantity, with 8,311 units sold.
3. **Annual performance:** 2013 recorded the highest annual revenue at approximately 43.62 million.
4. **Territory performance:** Southwest generated the highest territory revenue in the original territory analysis, totaling approximately 24.18 million.
5. **Customer performance:** Brakes and Gears was the highest-revenue customer, generating approximately 877,107.19.

## Investigation of the 2014 Revenue Decline

### Overall Performance

Revenue declined from approximately 43.62 million in 2013 to 20.06 million in 2014, representing a decrease of approximately 54.02%.

During the same period:

- **Order count:** Decreased from 14,182 to 11,761, a decline of approximately 17.07%.
- **Average revenue per order:** Decreased from approximately 3,075.90 to 1,705.46, a decline of approximately 44.56%.

These results show that the revenue decline coincided with both fewer orders and lower average revenue per order.

### Product Performance

Mountain-200 Black, 38 experienced the largest absolute revenue decline among the products investigated, with revenue decreasing by approximately 1.17 million between 2013 and 2014.

The top five products by revenue in both years consisted of Mountain-200 variants. This concentration makes product-level performance and product mix useful areas for further investigation.

### Sales Territory Performance

Revenue declined in all ten sales territories between 2013 and 2014.

- **Largest percentage decline:** Northeast, approximately 70.42%.
- **Largest absolute revenue decline:** Southwest, approximately 5.14 million.
- **Smallest percentage decline:** Australia, approximately 34.58%.

Order counts also declined across all territories. Central, Northeast, and Southeast experienced particularly large order-count declines, while Canada, Southwest, France, and Northwest experienced substantial declines in average revenue per order.

### Order Size and Average Revenue

Average revenue per order declined in all ten territories.

Canada recorded the largest percentage decline in average revenue per order, approximately 54.06%, followed by Southwest at approximately 50.18%.

Average units per order also declined in every territory. The largest percentage declines were observed in Southwest, approximately 50.15%, and Canada, approximately 48.46%.

These patterns suggest that lower quantities per order may have contributed to declining average order revenue in some territories. However, changes in product mix, pricing, and discounts may also have influenced the results.

## Business Recommendations

1. **Investigate declining product revenue:** Examine the product-level sales patterns for Mountain-200 variants and other products with large revenue declines.
2. **Investigate territory performance:** Prioritize Southwest and Canada for further analysis of order size, product mix, and average revenue per order.
3. **Examine order-count declines:** Investigate the substantial reductions in order counts in Central, Northeast, and Southeast.
4. **Evaluate customer purchasing behaviour:** Examine changes in purchasing frequency, quantities, and product preferences to identify potential explanations for declining revenue.
5. **Validate potential causes before taking action:** Review relevant pricing, discount, customer, and product data before attributing the revenue decline to any specific factor.

## Limitations

- The analysis identifies changes and associations but does not establish the underlying causes of the revenue decline.
- Average revenue and average units per order can conceal differences between individual orders and customers.
- Product mix, pricing, discounts, and other factors may influence revenue independently of order counts and quantities.
- The analysis focuses on the available historical data and does not establish whether the observed trends continued beyond the period examined.

## Data Validation

Total revenue calculated from sales-detail records was reconciled against the sum of annual revenue figures. The totals matched, supporting the consistency of the annual revenue calculation.

Order counts were calculated using distinct sales order IDs to avoid counting an order multiple times when it contained multiple product lines.
