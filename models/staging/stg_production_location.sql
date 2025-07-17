WITH fonte_raw AS (
    SELECT *
    FROM `adventureworks`.`ingest`.`raw_production_location`
)

, renomeado AS (
    SELECT
        CAST(locationid AS INT) AS location_id,
        CAST(name AS STRING) AS nome,
        CAST(costrate AS DECIMAL(19,4)) AS taxa_custo,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
