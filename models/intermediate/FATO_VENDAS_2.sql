with

-- Header do pedido
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

-- Itens do pedido
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

-- Clientes com dados pessoais
clientes as (
    select * from {{ ref('stg_sales_customer') }}
),

pessoas as (
    select * from {{ ref('stg_person_person') }}
),

clientes_com_dados_pessoais as (
    select
        c.customer_id,
        c.store_id,
        c.person_id,
        c.territory_id,
        c.numero_conta,

        p.tipo_pessoa,
        p.estilo_nome,
        p.titulo,
        p.primeiro_nome,
        p.nome_meio,
        p.sobrenome,
        p.sufixo,
        p.promocao_email,
        p.info_contato_adicional,
        p.dados_demograficos
    from clientes c
    left join pessoas p on c.person_id = p.business_entity_id
),

-- Business
dim_business as (
    select
        business_id,
        business_name
    from {{ ref('stg_sales_store') }}
),  

-- Produto
dim_produto as (
    select
        product_id,
        nome,
        modelo_produto_id,
        subcategoria_produto_id
    from {{ ref('stg_production_product') }}
),

-- Vendedor
dim_vendedor as (
    select
        business_entity_id as vendedor_id,
        nome_vendedor
    from {{ ref('stg_sales_salesperson') }}
),

-- Território
dim_territorio as (
    select
        territory_id,
        nome_territorio,
        grupo
    from {{ ref('stg_sales_salesterritory') }}
),

-- Fato vendas consolidada
fato_vendas as (
    select
        sh.salesorder_id,
        sh.data_pedido,
        sh.status_pedido,
        sh.total,

        sd.salesorderdetail_id,
        sd.produto_id,
        sd.quantidade_pedida,
        sd.preco_unitario,
        sd.desconto_preco_unitario,

        sh.cliente_id,
        c.primeiro_nome,
        c.sobrenome,
        c.tipo_pessoa,
        c.numero_conta,

        sh.vendedor_id,
        v.nome_vendedor,

        sh.territorio_id,
        t.nome_territorio,
        t.grupo,

        p.nome as nome_produto,
        p.modelo_produto_id as categoria_id,
        subcategoria_produto_id as subcategoria_id,

        b.business_name

    from sales_header sh
    inner join sales_detail sd on sh.salesorder_id = sd.salesorder_id
    left join clientes_com_dados_pessoais c on sh.cliente_id = c.customer_id
    left join dim_vendedor v on sh.vendedor_id = v.vendedor_id
    left join dim_territorio t on sh.territorio_id = t.territory_id
    left join dim_produto p on sd.produto_id = p.product_id
    left join dim_business b on c.store_id = b.business_id
)

select * from fato_vendas
