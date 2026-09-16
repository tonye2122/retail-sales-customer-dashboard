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
