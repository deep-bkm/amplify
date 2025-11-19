--b. Number Events per user per product last week.

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

final as (
    select 
        count(fct_user_event.event_id_sk) as event_id_cnt, --event_id count
        dim_user.user_id, --by user
        dim_product.product_name, --by product  

    from fct_user_event
    left join dim_user
    on fct_user_event.user_sk = dim_user.user_sk
    left join dim_product
    where fct_user_event.event_ts >= date_trunc('week', current_date) - 7
        and fct_user_event.event_ts < date_trunc('week', current_date) --looking at last week
    group by all
)

select 
    *,
    convert_timezone('UTC', current_timestamp()) as updated_at_ts
from final
