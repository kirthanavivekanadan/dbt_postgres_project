{{ config(
    materialized = 'view',
    schema = 'public',
    alias = 'stg_products'

)}}

with source_products as (
    select * from {{ source('public', 'products') }}
)

select
    id,
    name,
    category,
    price_gbp::numeric(10,2) as price_gbp
from source_products