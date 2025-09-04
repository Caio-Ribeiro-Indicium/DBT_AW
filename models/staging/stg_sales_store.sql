
with fonte_raw as (

    select *
    from {{ source('erp', 'raw_sales_store') }}

),

renomeado as (

    select
        cast(businessentityid as int) as business_id,       -- Business ID
        name as business_name,                               -- Business NAME
        rowguid,
        modifieddate
    from fonte_raw

)

select *
from renomeado
