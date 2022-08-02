

with temp1 as (
    select
        {{ json_extract_scalar('_airbyte_data', ['item-name'], ['item-name']) }}::text as item_name,
        {{ json_extract_scalar('_airbyte_data', ['item-description'], ['item-description']) }}::text as item_description,
        {{ json_extract_scalar('_airbyte_data', ['listing-id'], ['listing-id']) }}::text as listing_id,
        {{ json_extract_scalar('_airbyte_data', ['seller-sku'], ['seller-sku']) }}::text as seller_sku,
        nullif({{ json_extract_scalar('_airbyte_data', ['price'], ['price']) }}, '')::float as price,
        nullif({{ json_extract_scalar('_airbyte_data', ['quantity'], ['quantity']) }}, '')::float as quantity,
        {{ json_extract_scalar('_airbyte_data', ['open-date'], ['open-date']) }}::text as open_date,
        {{ json_extract_scalar('_airbyte_data', ['image-url'], ['image-url']) }}::text as image_url,
        {{ json_extract_scalar('_airbyte_data', ['item-is-marketplace'], ['item-is-marketplace']) }}::text as item_is_marketplace,
        {{ json_extract_scalar('_airbyte_data', ['product-id-type'], ['product-id-type']) }}::text as product_id_type,
        {{ json_extract_scalar('_airbyte_data', ['zshop-shipping-fee'], ['zshop-shipping-fee']) }}::text as zshop_shipping_fee,
        {{ json_extract_scalar('_airbyte_data', ['item-note'], ['item-note']) }}::text as item_note,
        {{ json_extract_scalar('_airbyte_data', ['item-condition'], ['item-condition']) }}::text as item_condition,
        {{ json_extract_scalar('_airbyte_data', ['zshop-category1'], ['zshop-category1']) }}::text as zshop_category1,
        {{ json_extract_scalar('_airbyte_data', ['zshop-browse-path'], ['zshop-browse-path']) }}::text as zshop_browse_path,
        {{ json_extract_scalar('_airbyte_data', ['zshop-storefront-feature'], ['zshop-storefront-feature']) }}::text as zshop_storefront_feature,
        {{ json_extract_scalar('_airbyte_data', ['asin1'], ['asin1']) }}::text as asin1,
        {{ json_extract_scalar('_airbyte_data', ['asin2'], ['asin2']) }}::text as asin2,
        {{ json_extract_scalar('_airbyte_data', ['asin3'], ['asin3']) }}::text as asin3,
        {{ json_extract_scalar('_airbyte_data', ['will-ship-internationally'], ['will-ship-internationally']) }}::text as will_ship_internationally,
        {{ json_extract_scalar('_airbyte_data', ['expedited-shipping'], ['expedited-shipping']) }}::text as expedited_shipping,
        {{ json_extract_scalar('_airbyte_data', ['zshop-boldface'], ['zshop-boldface']) }}::text as zshop_boldface,
        {{ json_extract_scalar('_airbyte_data', ['product-id'], ['product-id']) }}::text as product_id,
        {{ json_extract_scalar('_airbyte_data', ['bid-for-featured-placement'], ['bid-for-featured-placement']) }}::text as bid_for_featured_placement,
        {{ json_extract_scalar('_airbyte_data', ['add-delete'], ['add-delete']) }}::text as add_delete,
        {{ json_extract_scalar('_airbyte_data', ['pending-quantity'], ['pending-quantity']) }}::text as pending_quantity,
        {{ json_extract_scalar('_airbyte_data', ['fulfillment-channel'], ['fulfillment-channel']) }}::text as fulfillment_channel,
        {{ json_extract_scalar('_airbyte_data', ['merchant-shipping-group'], ['merchant-shipping-group']) }}::text as merchant_shipping_group,
        {{ json_extract_scalar('_airbyte_data', ['status'], ['status']) }}::text as status
    from {{ source(
            env_var('DATABASE_SCHEMA', var('source_schema', '')),
            '_airbyte_raw_get_merchant_listings_all_data'
    ) }} as table_alias
)
select 
    *
from temp1




