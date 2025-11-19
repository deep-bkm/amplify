with stg_amplify__user_event as (

    select object_name
    from {{ ref('stg_amplify__user_event') }}
    where object_name is not null
    group by all

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['object_name']) }} as object_sk,
        object_name,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__user_event
    group by all

)
 
select * 
from final
