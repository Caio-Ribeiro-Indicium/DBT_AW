WITH fonte_raw AS (
    SELECT *
    FROM `adventureworks`.`ingest`.`raw_production_product`
)

, renomeado AS (
    SELECT
        CAST(productid AS INT) AS product_id,
        CAST(name AS STRING) AS nome,
        CAST(productnumber AS STRING) AS numero_produto,
        CAST(makeflag AS BOOLEAN) AS flag_fabricar,
        CAST(finishedgoodsflag AS BOOLEAN) AS flag_produto_finalizado,
        CAST(color AS STRING) AS cor,
        CAST(safetystocklevel AS SMALLINT) AS estoque_seguranca,
        CAST(reorderpoint AS SMALLINT) AS ponto_reposicao,
        CAST(standardcost AS DECIMAL(19,4)) AS custo_padrao,
        CAST(listprice AS DECIMAL(19,4)) AS preco_lista,
        CAST(size AS STRING) AS tamanho,
        CAST(weight AS DECIMAL(19,4)) AS peso,
        CAST(productsubcategoryid AS INT) AS subcategoria_produto_id,
        CAST(style AS STRING) AS estilo,
        CAST(productmodelid AS INT) AS modelo_produto_id,
        CAST(sellstartdate AS DATE) AS data_inicio_venda,
        CAST(sellenddate AS DATE) AS data_descontinuacao,  -- ajustado para data_descontinuacao
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
