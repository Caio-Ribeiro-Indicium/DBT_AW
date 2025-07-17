WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_production_productsubcategory') }}
)

, renomeado AS (
    SELECT
        CAST(productsubcategoryid AS INT) AS subcategoria_produto_id,
        CAST(productcategoryid AS INT) AS categoria_produto_id,
        CAST(name AS STRING) AS nome_subcategoria,
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
