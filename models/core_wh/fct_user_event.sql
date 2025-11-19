with stg_amplify__user_event as (

    select *
    from {{ ref('stg_amplify__user_event') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['id']) }} as event_id_sk,
        {{ dbt_utils.generate_surrogate_key(['object_name']) }} as object_sk,
        {{ dbt_utils.generate_surrogate_key(['product_name']) }} as product_sk,
        {{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_sk,               
        {{ dbt_utils.generate_surrogate_key(['verb_name']) }} as verb_sk,
        id as event_id,
        event_ts,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__user_event

)
 
select * 
from final
