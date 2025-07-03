{{ config(
    materialized='table',
    schema='public',
    alias='customer_segments'
) }}

with customer_metrics as (

    select
        customer_id,

        -- Total spend per customer
        sum(total_spend) as total_spending,

        -- Number of transactions
        count(transaction_id) as purchase_frequency,

        -- Count of distinct products bought
        count(distinct product_id) as product_diversity

    from {{ ref('fct_transactions') }}

    group by 1
),

segments as (

    select
        customer_id,
        total_spending,

        case
            when total_spending > 500 then 'High'
            when total_spending between 100 and 500 then 'Medium'
            else 'Low'
        end as spending_segment,

        purchase_frequency,

        case
            when purchase_frequency > 6 then 'Frequent'
            when purchase_frequency between 3 and 6 then 'Occasional'
            else 'Rare'
        end as frequency_segment,

        product_diversity,

        case
            when product_diversity >= 5 then 'Diverse'
            else 'Focused'
        end as diversity_segment

    from customer_metrics

)

select * from segments
