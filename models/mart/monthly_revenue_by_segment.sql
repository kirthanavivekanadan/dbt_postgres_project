{{ config(
    materialized='table',
    schema='public',
    alias='monthly_revenue_by_segment'
) }}

select
    date_trunc('month', tx.transaction_date) as month,
    cs.spending_segment,
    sum(tx.total_spend) as monthly_revenue
from {{ ref('fct_transactions') }} tx
join {{ ref('customer_segments') }} cs on tx.customer_id = cs.customer_id
group by 1, 2
