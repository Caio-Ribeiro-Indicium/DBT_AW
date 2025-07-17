 with fonte_Person as (
     select *   
     from {{ source('erp', 'person__person') }}
 ),
 TmpTable as (
     select
         cast(businessentityid as string) as id_pessoa
         , cast(persontype as string) as pessoa_tipo
         , coalesce(firstname, '') || ' ' || 
          coalesce(middlename, '') || ' ' || 
          coalesce(lastname, '') as nome_cliente
     from fonte_Person
 )
 
 select *
 from TmpTable
