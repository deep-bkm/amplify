--d. Number of overall events by user last month segmented by Verbs and Objects

with fct_user_event as (
    select *
    from {{ ref('fct_user_event') }}
),

dim_user as (
    select *
    from {{ ref('dim_user') }}
),

dim_verb as (
    select *
    from {{ ref('dim_verb') }}
),

dim_object as (
    select *
    from {{ ref('dim_object') }}
),

final as (
    select 
        count(fct_user_event.event_id_sk) as event_id_cnt, --event_id count
        dim_user.user_id, --by user
        dim_verb.verb_name, --by verb
        dim_object.object_name, --by object
        
    from fct_user_event
    left join dim_user
    on fct_user_event.user_sk = dim_user.user_sk
    left join dim_verb
    on fct_user_event.verb_sk = dim_verb.verb_sk
    left join dim_object
    on fct_user_event.object_sk = dim_object.object_sk
    where date_trunc('month', fct_user_event.event_ts::date) = date_trunc('month', add_months(current_date, -1)) --event_ts from the last month  
    group by all
)

select *
from final
