with stg_amplify__product as (

    select object
    from {{ ref('stg_amplify__product') }}
    group by all

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['object']) }} as object_sk,
        object,
        convert_timezone('UTC', current_timestamp()) as updated_at_ts
    from stg_amplify__product
    group by all

)
 
select * 
from final
