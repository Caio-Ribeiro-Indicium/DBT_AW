with

sales_header as (
    select
        salesorder_id,
        data_pedido,
        cliente_id,
        vendedor_id,
        territorio_id,
        status_pedido,
        total
    from {{ ref('stg_sales_salesorderheader') }}
),

sales_detail as (
    select
        salesorderdetail_id,
        salesorder_id,
        quantidade_pedida,
        produto_id,
        preco_unitario,
        desconto_preco_unitario
    from {{ ref('stg_sales_salesorderdetail') }}
),

fato_vendas as (
    select
        sh.salesorder_id,
        sh.data_pedido,
        sh.cliente_id,
        sh.vendedor_id,
        sh.territorio_id,
        sh.status_pedido,
        sh.total,

        sd.salesorderdetail_id,
        sd.produto_id,
        sd.quantidade_pedida,
        sd.preco_unitario,
        sd.desconto_preco_unitario
    from sales_header sh
    inner join sales_detail sd on sh.salesorder_id = sd.salesorder_id
)

select * from fato_vendas
