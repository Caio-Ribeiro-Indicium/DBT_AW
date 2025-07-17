with fonte_Product as (
select *   
from {{ source('erp', 'production__product') }}
)
, TmpTable as (
    select
        cast(productid as string) as produto_id
        ,cast(name as string) as nome_do_produto
        ,cast(productnumber as string) as numero_do_produto
        ,cast(productsubcategoryid as string) as subcategoria_id
   
    from fonte_Product
)

select *
from TmpTable