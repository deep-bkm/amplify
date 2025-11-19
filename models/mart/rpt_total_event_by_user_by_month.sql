--e. total events by users by month

with fct_user_event as (
    select *
    from {{ ref('fct_user_event') }}
),

dim_user as (
    select *
    from {{ ref('dim_user') }}
),

final as (
    select 
        count(fct_user_event.event_id_sk) as event_id_cnt, --event_id count
        dim_user.user_id,
        date_trunc('month', fct_user_event.event_ts::date) as event_month_dt
        
    from fct_user_event
    left join dim_user
    on fct_user_event.user_sk = dim_user.user_sk
    group by all
    order by 2, 3 desc
)

select 
    *,
    convert_timezone('UTC', current_timestamp()) as updated_at_ts
from final
