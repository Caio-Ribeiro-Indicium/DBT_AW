with fonte_salesorderdetail as (
select *   
from {{ source('erp', 'sales__salesorderdetail') }}
)
, TmpTable as (
    select

         cast(salesorderid as string) as id_pedido
        , cast(salesorderdetailid as string) as id_pedido_detalhe
        , cast(orderqty as int) as qtde
        , cast(productid as string) as id_produto
        , cast(unitprice as numeric(18,4)) as preco_unitario
        , cast(unitpricediscount as numeric(18,4)) as preco_unitario_desconto
        , orderqty*unitprice* (1-unitpricediscount) as valor_total
   
    from fonte_salesorderdetail
)

select *
from TmpTable