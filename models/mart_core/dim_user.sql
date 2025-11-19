with stg_amplify__product as (

    select user_id
    from {{ ref('stg_amplify__product') }}
    where user_id is not null
    group by all

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_sk,
        user_id,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__product
    group by all

)
 
select * 
from final
