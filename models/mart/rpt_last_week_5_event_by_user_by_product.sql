-- a. number of users with more than 5 events last week by product

with fct_user_event as (
    select *
    from {{ ref('fct_user_event') }}
),

dim_user as (
    select *
    from {{ ref('dim_user') }}
),

dim_product as (
    select *
    from {{ ref('dim_product') }}
),

event_user_agg as (
    select 
        count(fct_user_event.event_id_sk) as event_id_cnt, --event_id count
        dim_user.user_id, --by user
        dim_product.product_name, --by product  

    from fct_user_event
    left join dim_user
    on fct_user_event.user_sk = dim_user.user_sk
    left join dim_product
    on fct_user_event.product_sk = dim_product.product_sk
    where fct_user_event.event_ts >= date_trunc('week', current_date) - 7
        and fct_user_event.event_ts < date_trunc('week', current_date) --looking at last week
    group by all
),

final as (
    select *
    from event_user_agg
    where event_id_cnt > 5 --users with more than 5 events 
)

select 
    *,
    convert_timezone('UTC', current_timestamp()) as updated_at_ts    
from final
