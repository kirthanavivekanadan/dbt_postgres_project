{{ config(
    materialized='view',
    schema='public',
    alias ='stg_transactions'
)}}

with source_transactions as (
    select * from {{ source('public','transactions')}}
)

select
    id,
    customer_id,
    product_id,
    quantity::int as quantity,
    transaction_date::date as transaction_date
from source_transactions