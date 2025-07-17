with fonte_prodcategory as (
select *   
from {{ source('erp', 'production__productcategory') }}

)
, TmpTable as (
    select
        cast(productcategoryid as string) as categoria_id
        ,cast(name as string) as nome_categoria
   
    from fonte_prodcategory
)

select *
from TmpTable