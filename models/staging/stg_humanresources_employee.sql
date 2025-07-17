WITH fonte_raw AS (
    SELECT *
    FROM {{ source('erp', 'raw_humanresources_employee') }}
)

, renomeado AS (
    SELECT
        CAST(businessentityid AS INT) AS business_entity_id,
        CAST(nationalidnumber AS STRING) AS numero_identificacao_nacional,
        CAST(loginid AS STRING) AS login_id,
        CAST(jobtitle AS STRING) AS titulo_cargo,
        CAST(birthdate AS DATE) AS data_nascimento,
        CAST(maritalstatus AS STRING) AS estado_civil,
        CAST(gender AS STRING) AS genero,
        CAST(hiredate AS DATE) AS data_contratacao,
        CAST(salariedflag AS BOOLEAN) AS flag_assalariado,
        CAST(vacationhours AS SMALLINT) AS horas_ferias,
        CAST(sickleavehours AS SMALLINT) AS horas_licenca_doenca,
        CAST(currentflag AS BOOLEAN) AS flag_atual,
        CAST(rowguid AS STRING) AS rowguid,
        CAST(modifieddate AS TIMESTAMP) AS data_modificacao
    FROM fonte_raw
)

SELECT *
FROM renomeado
