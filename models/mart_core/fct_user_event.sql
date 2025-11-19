with stg_amplify__product as (

    select *
    from {{ ref('stg_amplify__product') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['id']) }} as event_id_sk,
        {{ dbt_utils.generate_surrogate_key(['object']) }} as object_sk,
        {{ dbt_utils.generate_surrogate_key(['product_name']) }} as product_sk,
        {{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_sk,               
        {{ dbt_utils.generate_surrogate_key(['verb']) }} as verb_sk,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__product

)
 
select * 
from final
