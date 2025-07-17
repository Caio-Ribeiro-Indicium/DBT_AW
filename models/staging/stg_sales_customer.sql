WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_sales_customer') }}
)

, renomeado AS (
    SELECT
        CAST(customerid AS INT) AS customer_id,
        CAST(storeid AS INT) AS store_id,
        CAST(personid AS INT) AS person_id,
        CAST(territoryid AS INT) AS territory_id,
        CAST(accountnumber AS STRING) AS numero_conta,
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
