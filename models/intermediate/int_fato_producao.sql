with

ordens_producao as (
    select * from {{ ref('stg_production_workorder') }}
),

produtos as (
    select * from {{ ref('stg_production_product') }}
),

fato_producao as (
    select 
        o.workorder_id,
        o.produto_id,
        o.quantidade_pedida,
        o.quantidade_rejeitada,
        o.data_inicio,
        o.data_fim,
        o.data_vencimento,
        o.motivo_rejeicao_id,
        o.data_modificacao as data_modificacao_ordem,
        p.nome as nome_produto,
        p.numero_produto,
        p.flag_fabricar,
        p.flag_produto_finalizado,
        p.cor,
        p.estoque_seguranca,
        p.ponto_reposicao,
        p.custo_padrao,
        p.preco_lista,
        p.tamanho,
        p.peso,
        p.subcategoria_produto_id,
        p.estilo,
        p.modelo_produto_id,
        p.data_inicio_venda,
        p.data_descontinuacao,
        p.rowguid as rowguid_produto,
        p.data_modificacao as data_modificacao_produto
    from ordens_producao o
    inner join produtos p on o.produto_id = p.product_id
)

select * from fato_producao
