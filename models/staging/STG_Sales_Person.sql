with fonte_salesperson as (
select *   
from {{ source('erp', 'sales__salesperson') }}
)
, TmpTable as (
    select
     
         cast(businessentityid as string) as id_vendedor
        , cast(territoryid as string) as id_territorio
       -- , cast(salesquota as int) 
       --  , cast(bonus as int) 
       -- , cast(commissionpct as int) 
        -- , cast(salesytd as int) 
       -- , cast(saleslastyear as int) 
       
    from fonte_salesperson
)

select *
from TmpTable