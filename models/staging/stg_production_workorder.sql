WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_production_workorder') }}
)

, renomeado AS (
    SELECT
        CAST(workorderid AS INT) AS workorder_id,
        CAST(productid AS INT) AS produto_id,
        CAST(orderqty AS INT) AS quantidade_pedida,
        CAST(scrappedqty AS INT) AS quantidade_rejeitada,
        CAST(startdate AS DATE) AS data_inicio,
        CAST(enddate AS DATE) AS data_fim,
        CAST(duedate AS DATE) AS data_vencimento,
        CAST(scrapreasonid AS INT) AS motivo_rejeicao_id,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
