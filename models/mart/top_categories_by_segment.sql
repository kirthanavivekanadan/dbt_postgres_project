{{ config(
    materialized='table',
    schema='public',
    alias='top_categories_by_segment'
) }}

with category_counts as (
    select
        cs.spending_segment,
        p.category,
        sum(tx.quantity) as total_quantity
    from {{ ref('fct_transactions') }} tx
    join {{ ref('customer_segments') }} cs on tx.customer_id = cs.customer_id
    join {{ ref('dim_products') }} p on tx.product_id = p.product_id
    group by 1, 2
),

ranked_categories as (
    select *,
        row_number() over (partition by spending_segment order by total_quantity desc) as rank
    from category_counts
)

select
    spending_segment,
    category,
    total_quantity,
    rank
from ranked_categories
where rank <= 3
