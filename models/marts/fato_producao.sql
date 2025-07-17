with fato_producao as (
    select *
    from {{ ref('int_fato_producao') }}
)

select *
from fato_producao