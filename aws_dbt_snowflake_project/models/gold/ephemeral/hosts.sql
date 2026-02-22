{{ 
  config(
    materialized = 'ephemeral',
    )
}}
-- This model is an example of an ephemeral model that references the 'obt' model.
-- Ephemeral models are not materialized in the database; instead, they are inlined into the SQL of downstream models that reference them. This allows for modular SQL development without creating additional tables or views in the database.
-- In this example, we are selecting all columns from the 'obt' model and creating a CTE (Common Table Expression) named 'bookings'. The final SELECT statement then retrieves all records from the 'bookings' CTE.
-- only context not number or facts
with hosts as 
(
    select 
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT
    from {{ ref('obt') }}
)

select * from hosts
