with fonte_address as (
select *   
from {{ source('erp', 'person__address') }}

)
, TmpTable as (
    select
        cast(addressid as string) as endereco_id
        ,cast(addressline1 as string) as endereco
        ,cast(addressline2 as string) as endereco2
        ,cast(city as string) as cidade
        ,cast(stateprovinceid as int) as estado
   
    from fonte_address
)

select *
from TmpTable