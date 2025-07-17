WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_sales_salesorderheader') }}
)

, renomeado AS (
    SELECT
        CAST(salesorderid AS INT) AS salesorder_id,
        CAST(revisionnumber AS SMALLINT) AS numero_revisao,
        CAST(orderdate AS DATE) AS data_pedido,
        CAST(duedate AS DATE) AS data_vencimento,
        CAST(shipdate AS DATE) AS data_envio,
        CAST(status AS TINYINT) AS status_pedido,
        CAST(onlineorderflag AS BOOLEAN) AS pedido_online,
        CAST(purchaseordernumber AS STRING) AS numero_ordem_compra,
        CAST(accountnumber AS STRING) AS numero_conta,
        CAST(customerid AS INT) AS cliente_id,
        CAST(salespersonid AS INT) AS vendedor_id,
        CAST(territoryid AS INT) AS territorio_id,
        CAST(billtoaddressid AS INT) AS endereco_faturamento_id,
        CAST(shiptoaddressid AS INT) AS endereco_entrega_id,
        CAST(shipmethodid AS INT) AS metodo_envio_id,
        CAST(creditcardid AS INT) AS cartao_credito_id,
        CAST(creditcardapprovalcode AS STRING) AS codigo_aprovacao,
        CAST(currencyrateid AS INT) AS taxa_cambio_id,
        CAST(subtotal AS DECIMAL(19,4)) AS subtotal,
        CAST(taxamt AS DECIMAL(19,4)) AS valor_imposto,
        CAST(freight AS DECIMAL(19,4)) AS frete,
        CAST(totaldue AS DECIMAL(19,4)) AS total,
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
