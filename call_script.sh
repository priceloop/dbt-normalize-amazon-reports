#!/bin/bash 

DATABASE_HOST=localhost \
DATABASE_PORT=5432 \
DATABASE_USERNAME=postgres \
DATABASE_PASSWORD=test3 \
DATABASE_NAME=priceloop \
DATABASE_SCHEMA=public \
SOURCE_RAW_MERCHANT_LISTING_ALL_DATA=_airbyte_raw_get_merchant_listings_all_data \
SOURCE_RAW_FBA_FULFILLMENT_CURRENT_INVENTORY_REPORT=_airbyte_raw_get_fba_fulfillment_current_inventory_data \
DESTINATION_TABLE1=merchant_listing13 \
DESTINATION_TABLE2=fba_fulfillment \
dbt run  --profiles-dir .