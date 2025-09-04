with

fonte_raw_salesperson as (
    select *
    from {{ source('erp', 'raw_sales_salesperson') }}
),

fonte_raw_person as (
    select *
    from {{ source('erp', 'raw_person_person') }}
),

renomeado as (
    select
        cast(sp.businessentityid as int) as business_entity_id,
        cast(sp.salesquota as decimal(19,4)) as quota_vendas,
        cast(sp.bonus as decimal(19,4)) as bonus,
        cast(sp.commissionpct as decimal(19,4)) as porcentagem_comissao,
        cast(sp.salesytd as decimal(19,4)) as vendas_ano,
        cast(sp.saleslastyear as decimal(19,4)) as vendas_ano_anterior,
        cast(sp.rowguid as string) as rowguid,
        cast(sp.modifieddate as timestamp) as data_modificacao,

        cast(pe.firstname as string) as primeiro_nome,
        cast(pe.lastname as string) as sobrenome,
        cast(pe.PersonType as string) as tipo_pessoa,
        concat_ws(' ', pe.firstname, pe.lastname) as nome_vendedor
        
    from fonte_raw_salesperson sp
    left join fonte_raw_person pe
        on sp.businessentityid = pe.businessentityid
)

select *
from renomeado
