WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_sales_salesperson') }}
)

, renomeado AS (
    SELECT
        CAST(businessentityid AS INT) AS business_entity_id,
        CAST(salesquota AS DECIMAL(19,4)) AS quota_vendas,
        CAST(bonus AS DECIMAL(19,4)) AS bonus,
        CAST(commissionpct AS DECIMAL(19,4)) AS porcentagem_comissao,
        CAST(salesytd AS DECIMAL(19,4)) AS vendas_ano,
        CAST(saleslastyear AS DECIMAL(19,4)) AS vendas_ano_anterior,
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
