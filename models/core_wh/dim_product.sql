with stg_amplify__user_event as (

    select product_name
    from {{ ref('stg_amplify__user_event') }}
    where product_name is not null
    group by all

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['product_name']) }} as product_sk,
        product_name,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__user_event
    group by all

)
 
select * 
from final
