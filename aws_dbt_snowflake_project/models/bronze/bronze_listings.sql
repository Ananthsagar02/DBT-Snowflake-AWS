select * from {{ source('staging', 'listings') }}

-- if we don't use source then we need to AIRBNB.STAGING.LISTINGS to get data. #}

 /* staging is the name of the source defined in the sources.yml file, and listings is the name of the table within that source.
  This model will create a new table in the database with the same data as the source table.
*/