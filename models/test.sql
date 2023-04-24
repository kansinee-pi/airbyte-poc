create table "test_2"."new_v_test"
as (
    select
        _airbyte_emitted_at,
        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,
        cast(jsonb_extract_path_text("_airbyte_data",'age') as integer) as "age",
        cast(jsonb_extract_path_text("_airbyte_data",'customer_name') as varchar) as "customer_name",
    from "test_2"."_airbyte_raw_v_test_table"
);