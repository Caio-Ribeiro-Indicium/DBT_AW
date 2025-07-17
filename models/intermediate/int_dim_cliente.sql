with

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
)

select * from clientes_com_dados_pessoais
