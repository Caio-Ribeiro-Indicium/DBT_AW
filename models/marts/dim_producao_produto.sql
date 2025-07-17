with dim_producao_produto as (
    select *
    from {{ ref('int_dim_producao_produto') }}
)

select *
from dim_producao_produto