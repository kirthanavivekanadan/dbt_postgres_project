{{ config(
    materialized='table',
    schema='public',
    alias='fct_transactions'
) }}

with tx as (
    select
        t.id as transaction_id,
        customer_id,
        product_id,
        quantity,
        transaction_date,
        quantity * price_gbp as total_spend
    from {{ ref('stg_transactions') }} t
    left join {{ ref('stg_products') }} p
    on t.product_id = p.id
)

select * from tx
