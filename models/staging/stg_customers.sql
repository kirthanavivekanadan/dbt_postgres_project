{{ config(
    materialized='view',
    schema='public',
    alias='stg_customers'
) }}



with source_customers as (
    select * from {{ source('public', 'customers') }}
)

select
    id,
    first_name,
    last_name,
    email,
    gender,
    age::int as age,
    country,
    signup_date::date as signup_date
from source_customers
