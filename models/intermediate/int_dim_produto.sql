with

produtos as (
    select * from {{ ref('stg_production_product') }}
)

select * from produtos
