## Customer Segmentation & Analytics Project

This project aims to segment customers based on their purchasing behavior and demographic information to generate actionable insights for marketing and product strategy. It follows modern data modeling practices using dbt and PostgreSQL, with data visualization in Tableau.

---

## Use Case

> Your company wants to implement **customer segmentation** to better understand buying behavior. The goal is to assign each customer to behavioral segments and analyze trends such as:
- Spending patterns
- Product preferences
- Monthly revenue contributions
- Top performing categories

---

## Tech Stack

- **Database:** PostgreSQL
- **Transformation:** dbt (staging → warehouse → marts)
- **Visualization:** Tableau
- **Environment:** dbt Cloud (recommended) or CLI

---

## Project Structure

```bash
dbt_project/
├── models/
│   ├── src/                     # Source declarations
│   ├── staging/                 # Clean and standardized raw data
│   ├── warehouse/               # Fact and dimension tables
│   └── marts/                   # Business-level aggregated tables
│       ├── customer_segments.sql
│       ├── monthly_revenue_by_segment.sql
│       ├── top_categories_by_segment.sql
│       ├── avg_purchase_value_by_segment.sql
│       └── customer_lifetime_value.sql
├── snapshots/                   # (Optional) For future SCD tracking
├── tests/                       # Schema & data quality tests
└── analysis/                    # (Optional) Ad hoc queries

