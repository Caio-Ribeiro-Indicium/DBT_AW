with

local_fabrica as (
    select * from {{ ref('stg_production_location') }}
)

select * from local_fabrica
