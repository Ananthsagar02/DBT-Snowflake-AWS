{% set configs = [
    {
        "table": "AIRBNB.SILVER.SILVER_BOOKINGS",
        "columns": "silver_bookings.*",
        "alias": "silver_bookings"
    },
    {
        "table": "AIRBNB.SILVER.SILVER_LISTINGS",
        "columns": "silver_listings.PROPERTY_TYPE, silver_listings.ROOM_TYPE, silver_listings.CITY, silver_listings.COUNTRY, silver_listings.ACCOMMODATES, silver_listings.BEDROOMS, silver_listings.BATHROOMS, silver_listings.PRICE_PER_NIGHT_TAG, silver_listings.CREATED_AT as LISTING_CREATED_AT",
        "alias": "silver_listings",
        "join_condition": "silver_bookings.LISTING_ID = silver_listings.LISTING_ID"
    },
    {
        "table": "AIRBNB.SILVER.SILVER_HOSTS",
        "columns": "silver_hosts.HOST_ID, silver_hosts.HOST_NAME, silver_hosts.HOST_SINCE, silver_hosts.IS_SUPERHOST, silver_hosts.RESPONSE_RATE,silver_hosts.RESPONSE_RATE_QUALITY, silver_hosts.CREATED_AT as HOST_CREATED_AT",
        "alias": "silver_hosts",
        "join_condition": "silver_listings.HOST_ID = silver_hosts.HOST_ID"
    }
] %}

SELECT 
    {% for config in configs %}
    {{ config['columns'] }}{% if not loop.last %},{% endif %} -- select columns from each table
    {% endfor %}
FROM
{% for config in configs %}
    {% if loop.first %} -- for the first table, we start with FROM
       {{ config['table'] }} AS {{ config['alias'] }} -- start with the first table
    {% else %} -- for subsequent tables, we LEFT JOIN
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}  -- 
          ON {{ config['join_condition'] }}
    {% endif %}
{% endfor %}

-- 
-- This approaches for Dynamica and best one this to use 
/* SELECT 
    {% for config in configs %}
        {{ config['columns'] }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM
    {{ configs[0]['table'] }} AS {{ configs[0]['alias'] }}
    {% for config in configs[1:] %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
    {% endfor %}
*/
    