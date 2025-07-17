with fonte_Customer as (
select *   
from {{ source('erp', 'sales__customer') }}

)
, TmpTable as (
    select
       cast(customerid as string) as id_cliente
        , cast(personid as string) as id_person
        , cast(storeid as string) as id_loja
        , cast(territoryid as string) as id_territorio
        

    from fonte_Customer
)

select *
from TmpTable