with fonte_cc as (
select *   
from {{ source('erp', 'sales__creditcard') }}

)
, TmpTable as (
    select
        
        cast(creditcardid as string) as cartao_de_credito_id
        ,cast(cardtype as string) as tipo_cartao_de_credito
        ,cast(cardnumber as string) as numero_do_cartao
   
    from fonte_cc
)

select *
from TmpTable