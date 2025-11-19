--c. Number of Selected Verb events by product by month

with fct_user_event as (
    select *
    from {{ ref('fct_user_event') }}
),

dim_verb as (
    select *
    from {{ ref('dim_verb') }}
),

dim_product as (
    select *
    from {{ ref('dim_product') }}
),

final as (
    select 
        count(distinct fct_user_event.event_id_sk) as event_id_cnt, --event_id count
        dim_verb.verb_name, --by verb
        dim_product.product_name, --by product
        --either of below can be used to pull 'by month' depending on the data_type needs to be in a date format or text
        --year(fct_user_event.event_ts) || '-' || lpad(month(fct_user_event.event_ts), 2, 0) as year_month -- by month with a text data type       
        date_trunc('month', fct_user_event.event_ts)::date as month_first_day -- by month with a date datatype

    from fct_user_event
    left join dim_verb
    on fct_user_event.verb_sk = dim_verb.verb_sk
    left join dim_product
    on fct_user_event.product_sk = dim_product.product_sk    
    where lower(trim(dim_verb.verb_name)) = 'selected'
    group by all
)

select *
from final
