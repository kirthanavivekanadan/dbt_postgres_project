{{ config(
    materialized='table',
    schema='public',
    alias='dim_customers'
) }}

select
    id as customer_id,
    lower(first_name) || ' ' || lower(last_name) as full_name,
    email,
    gender,
    age,
    country,
    signup_date
from {{ ref('stg_customers') }}
