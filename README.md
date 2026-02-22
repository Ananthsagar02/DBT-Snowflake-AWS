# DBT-Snowflake-AWS
DBT + Snowflake + AWS

pip install uv
python -m venv .venv


source .venv/bin/activate or .venv/Scripts/activate

uv add dbt-snowflake(if get error name name in toml)

-- need to give any name for schema working in dbt code
schema (default schema that dbt will build objects in): dbt_schema


--put this in project folder
Profile aws_dbt_snowflake_project written to /home/codespace/.dbt/profiles.yml

# INSTALL
 -- power user for DBT


# before running dbt run ,run the dbt compile to make sure no errors
 # dbt run -- run the all model



 -- dbt run --select models/demo -for specific model to run


 -- SNAPSHOTS TO RUN
  -- dbt snapshot

  -- dbt clean.  to clean targets
  -- dbt build
