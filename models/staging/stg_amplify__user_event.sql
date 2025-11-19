/*staging model for event streamed data for the amplify product*/
with raw_amplify as (

    select *
    from {{ source('raw_amplify', 'user_event')}}

),

final as (

    select 
        product_properties:id::string as id, 
        product_properties:common:object::string as object_name,
        product_properties:common:product::string as product_name,
        product_properties:common:userId::integer as user_id,
        product_properties:common:verb::string as verb_name,
        product_properties:common:timestamp::timestamp as event_ts, --determine if this is local_ts or utc
        -- metafields
        'amplify' as source_name,
        convert_timezone('UTC', current_timestamp()) as dw_insert_ts
    from raw_amplify

)

select *
from final
