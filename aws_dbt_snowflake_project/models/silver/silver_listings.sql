{{ config(
    materialized='incremental',
    unique_key='LISTING_ID'
) }}

select LISTING_ID,
       HOST_ID,
       PROPERTY_TYPE,   
       CITY,
       COUNTRY,
       ROOM_TYPE,
       ACCOMMODATES,
       BEDROOMS,
       BATHROOMS,
       PRICE_PER_NIGHT,
      {{ tag('CAST(price_per_night AS INT)') }} AS price_per_night_TAG,
      CREATED_AT
       
from 
    {{ ref('bronze_listings') }}