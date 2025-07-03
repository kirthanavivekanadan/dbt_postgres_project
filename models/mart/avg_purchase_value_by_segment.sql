{{ config(
    materialized='table',
    schema='public',
    alias='avg_purchase_value_by_segment'
) }}

select
    spending_segment,
    avg(total_spending::numeric / nullif(purchase_frequency, 0)) as avg_purchase_value
from {{ ref('customer_segments') }}
group by 1
