with dim_local_fabrica as (
    select *
    from {{ ref('int_dim_local_fabrica') }}
)

select *
from dim_local_fabrica