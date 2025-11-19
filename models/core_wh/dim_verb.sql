with stg_amplify__user_event as (

    select verb_name
    from {{ ref('stg_amplify__user_event') }}
    where verb_name is not null
    group by all

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['verb_name']) }} as verb_sk,
        verb_name,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__user_event
    group by all

)
 
select * 
from final
