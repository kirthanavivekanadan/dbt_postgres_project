{{ config(
    materialized='table',
    schema='public',
    alias='dim_products'
) }}

select
    id as product_id,
    name as product_name,
    category,
    price_gbp
from {{ ref('stg_products') }}
