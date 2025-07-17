with

vendedores as (
    select * from {{ ref('stg_sales_salesperson') }}
),

funcionarios as (
    select * from {{ ref('stg_humanresources_employee') }}
),

vendedores_com_funcionario as (
    select 
        v.business_entity_id,
        v.quota_vendas,
        v.bonus,
        v.porcentagem_comissao,
        v.vendas_ano,
        v.vendas_ano_anterior,
        v.rowguid as rowguid_vendedor,
        v.data_modificacao as data_modificacao_vendedor,
        f.numero_identificacao_nacional,
        f.login_id,
        f.titulo_cargo,
        f.data_nascimento,
        f.estado_civil,
        f.genero,
        f.data_contratacao,
        f.flag_assalariado,
        f.horas_ferias,
        f.horas_licenca_doenca,
        f.flag_atual,
        f.rowguid as rowguid_funcionario,
        f.data_modificacao as data_modificacao_funcionario
    from vendedores v
    inner join funcionarios f on v.business_entity_id = f.business_entity_id
)

select * from vendedores_com_funcionario
