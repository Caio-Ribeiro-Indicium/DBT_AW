with origem_endereco as (
    select * 
    from {{ source('erp', 'RAW_PERSON_ADDRESS') }}
)

, endereco_tratado as (
    select
        cast(AddressID as string)              as endereco_id,
        cast(AddressLine1 as string)           as linha_endereco_1,
        cast(AddressLine2 as string)           as linha_endereco_2,
        cast(City as string)                   as cidade,
        cast(StateProvinceID as string)        as estado_id,
        cast(PostalCode as string)             as cep,
        cast(rowguid as string)                as uuid_endereco,
        cast(ModifiedDate as timestamp)        as data_modificacao
    from origem_endereco
)

select *
from endereco_tratado