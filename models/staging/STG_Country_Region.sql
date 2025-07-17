with fonte_Country as (
select *   
from {{ source('erp', 'person__countryregion') }}

)
, TmpTable as (
    select
    cast (countryregioncode as string) as pais_id
    , cast (name as string) as nome_pais

    from fonte_Country
)

select *
from TmpTable