with fonte_SalesReason as (
select *   
from {{ source('erp', 'sales__salesreason') }}

)
, TmpTable as (
    select
    cast(salesreasonid as string) as id_motivo
    ,cast(name as string) as motivo_de_venda
    ,cast(reasontype as string) as motivo_tipo
    from fonte_SalesReason
)

select *
from TmpTable