WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_sales_salesorderdetail') }}
)

, renomeado AS (
    SELECT
        CAST(salesorderdetailid AS INT) AS salesorderdetail_id,
        CAST(salesorderid AS INT) AS salesorder_id,
        CAST(orderqty AS SMALLINT) AS quantidade_pedida,
        CAST(productid AS INT) AS produto_id,
        CAST(unitprice AS DECIMAL(19,4)) AS preco_unitario,
        CAST(unitpricediscount AS DECIMAL(19,4)) AS desconto_preco_unitario,
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
