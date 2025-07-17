with fonte_employee as (
select *   
from {{ source('erp', 'humanresources__employee') }}

)
, TmpTable as (
    select
     
         cast(businessentityid as string) as id_funcionario
        , cast(nationalidnumber as string) as id_numero_nacional
        , cast(jobtitle as string) as cargo
        , cast(birthdate as date) as data_nascimento
       

    from fonte_employee
)

select *
from TmpTable