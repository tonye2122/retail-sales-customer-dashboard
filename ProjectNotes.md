# Project Notes

## Retail Sales & Customer Performance Dashboard

### Objective
Analyze retail sales data to identify trends across customers, products, regions, and time periods.

### Tools
Excel, SQL, Power BI

### Data Cleaning - Excel

**Dataset:** 9,994 rows, 21 columns

- Checked key fields for missing values; none were identified.
- Found that Order Date and Ship Date were imported as text.
- Converted both columns to proper Excel date values and validated using `ISNUMBER()`.
- Used `COUNTIFS()` to investigate repeated Order ID + Product ID combinations.
- Identified 16 potentially duplicated rows.
- Determined most were legitimate repeated products within the same order.
- Removed one duplicated transaction record.
- Rows after duplicate removal: **9,993**
 #update

## SQL Analysis – PostgreSQL

Imported the cleaned retail sales dataset into PostgreSQL and used SQL to perform exploratory business analysis.

### Analysis Completed
- Verified dataset integrity and row count (9,993 records)
- Calculated total sales, total profit, and quantity sold
- Calculated total unique orders and average order value
- Analyzed sales and profit by product category
- Compared regional sales and profitability
- Analyzed performance across customer segments
- Compared sales and profitability across sub-categories
- Investigated the relationship between discounts and profitability
- Analyzed annual sales and profit trends
- Calculated year-over-year (YoY) sales growth using SQL window functions

### Key Findings
- Total Sales: $2.30M
- Total Profit: $286.41K
- Total Orders: 5,009
- Average Order Value: $458.56
- Technology generated the highest category sales.
- The West generated the highest regional sales.
- Consumer was the largest customer segment by sales.
- Sales declined 2.78% in 2015 before increasing 29.47% in 2016 and 20.36% in 2017.
- Several heavily discounted sub-categories showed weak or negative profitability, suggesting discount strategy may be affecting margins.
