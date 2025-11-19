with stg_amplify__product as (

    select verb
    from {{ ref('stg_amplify__product') }}
    group by all

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['verb']) }} as verb_sk,
        verb,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__product
    group by all

)
 
select * 
from final
