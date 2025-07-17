with fonte_salesorderh as (
select *   
from {{ source('erp', 'sales__salesorderheader') }}

)
, TmpTable as (
    select

          cast(salesorderid as string) as id_pedido
        , cast(orderdate as date) as data_de_venda
        , cast(duedate as date) as data_de_vencimento
        , cast(shipdate as date) as data_de_envio
        , cast(status as string) as status
        , cast(accountnumber as string) as numero_da_conta
        , cast(customerid as string) as id_cliente
        , cast(salespersonid as string) as id_vendedor
        , cast(territoryid as string) as id_territorio
        , cast(billtoaddressid as string) as id_endereco
        , cast(shiptoaddressid as string) as id_endereco_envio
        , cast(shipmethodid as string) as id_metodo_envio
        , cast(creditcardid as string) as id_cartao_tipo
        , cast(subtotal as numeric(18,2)) as subtotal
        , cast(taxamt as numeric(18,2)) as taxamt
        , cast(freight as numeric(18,2)) as frete
        , cast(totaldue as numeric(18,2)) as valor_total

   
    from fonte_salesorderh
)

select *
from TmpTable