with

fonte_raw as (
    select * 
    from {{ source('erp', 'raw_sales_salesterritory') }}
),

renomeado as (
    select
        cast(territoryid as int) as territory_id,
        cast(name as string) as nome_territorio,
        cast(countryregioncode as string) as codigo_regiao_pais,
        cast(group as string) as grupo,
        cast(salesytd as decimal(18,2)) as vendas_ytd,
        cast(saleslastyear as decimal(18,2)) as vendas_ano_anterior,
        cast(costytd as decimal(18,2)) as custo_ytd,
        cast(costlastyear as decimal(18,2)) as custo_ano_anterior,
        cast(rowguid as string) as rowguid,
        cast(modifieddate as timestamp) as data_modificacao
    from fonte_raw
)

select * 
from renomeado
