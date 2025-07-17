with fonte_saleorderhsr as (
select *   
from {{ source('erp', 'sales__salesorderheadersalesreason') }}

)
, TmpTable as (
    select

    cast(salesorderid as string) as id_pedido
    ,cast(salesreasonid as string) as id_motivo

from fonte_saleorderhsr
)

select *
from TmpTable