with

produto_producao as (
    select * from {{ ref('stg_production_product') }}
)

select * from produto_producao
