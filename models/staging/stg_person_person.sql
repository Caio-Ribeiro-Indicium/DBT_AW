WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_person_person') }}
)

, renomeado AS (
    SELECT
        CAST(businessentityid AS INT) AS business_entity_id,
        CAST(persontype AS STRING) AS tipo_pessoa,
        CAST(nameStyle AS BOOLEAN) AS estilo_nome,
        CAST(title AS STRING) AS titulo,
        CAST(firstname AS STRING) AS primeiro_nome,
        CAST(middlename AS STRING) AS nome_meio,
        CAST(lastname AS STRING) AS sobrenome,
        CAST(suffix AS STRING) AS sufixo,
        CAST(emailpromotion AS INT) AS promocao_email,
        CAST(additionalcontactinfo AS STRING) AS info_contato_adicional,
        CAST(demographics AS STRING) AS dados_demograficos,
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
