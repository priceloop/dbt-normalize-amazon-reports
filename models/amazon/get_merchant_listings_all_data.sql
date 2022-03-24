with temp1 as (
    select
        {{ json_extract_scalar('_airbyte_data', ['item-name'], ['item-name']) }}::text as item_name
    from {{ source('amazon', '_airbyte_raw_rounding_configs') }} as table_alias
)
select 
    customer_id
from temp1