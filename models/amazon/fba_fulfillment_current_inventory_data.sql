{{ 
    config(
        alias=env_var('DESTINATION_TABLE2', var('destination_table', ''))
    )
 }}

with temp2 as (
    select
        {{ json_extract_scalar('_airbyte_data', ['sku'], ['sku']) }}::text as sku,
        {{ json_extract_scalar('_airbyte_data', ['fnsku'], ['fnsku']) }}::text as fnsku,
        {{ json_extract_scalar('_airbyte_data', ['country'], ['country']) }}::text as marketplace,
        -- {{ json_extract_scalar('_airbyte_data', ['seller-sku'], ['seller-sku']) }}::text as seller_sku,
        {{ json_extract_scalar('_airbyte_data', ['snapshot-date'], ['snapshot-date']) }}::date as snapshot_date,
        {{ json_extract_scalar('_airbyte_data', ['fulfillment-center-id'], ['fulfillment-center-id']) }}::text as fulfillment_center_id,
        nullif({{ json_extract_scalar('_airbyte_data', ['quantity'], ['quantity']) }}, '')::float as sellable_inventory
        
    from {{ source(
            env_var('DATABASE_SCHEMA', var('source_schema', '')),
            env_var('SOURCE_RAW_FBA_FULFILLMENT_CURRENT_INVENTORY_REPORT', var('source_table', ''))
    ) }} as table_alias
)
select 
    *
from temp2




