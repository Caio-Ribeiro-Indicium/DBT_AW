
# Projeto DBT_AW AdventureWorks Pipeline

**Versão 1.1**

Este repositório contém um pipeline completo de extração, ingestão e transformação da base de dados *AdventureWorks*.

## 🧠 Visão Geral

Este projeto tem como objetivo:

- Extrair dados da base *AdventureWorks* a partir de um banco **Microsoft SQL Server**
- Salvar os dados no **Databricks** em arquivos **JSONL**
- Ingerir esses arquivos como **Delta Tables** no Databricks
- Transformar os dados usando **DBT Cloud**, nas camadas:
  - "stg" (staging)
  - "int" (intermediária)
  - "marts" (dimensões e fatos)
- Gerar as tabelas finais:
  - "dim_clientes"
  - "dim_producao_produto"
  - "dim_produto"
  - "dim_vendedor"
  - "fato_producao"
  - "fato_vendas"

>  Este projeto é compatível com as versões gratuitas do **Databricks** e **DBT Cloud**.

---

##  Pré-requisitos

- Conta ativa no Databricks (https://community.cloud.databricks.com/)
- Conta gratuita no DBT Cloud (https://www.getdbt.com/signup/)
- Acesso a um banco Microsoft SQL Server com a base AdventureWorks
- Token de acesso pessoal no Databricks (para uso via API ou notebook)
- Git instalado localmente (para clonar o repositório)

---

## 🚀 Passo a Passo para Executar o Projeto

### 🔁 1. Clonar e importar repositório
- Clone este repositório:
  """bash
  git clone https://github.com/Caio-Ribeiro-Indicium/DBT_AW.git
  """
- No DBT Cloud, vá até a aba **"Develop" > "Start from Repo"** e importe o repositório GitHub.

### ⚙️ 2. Configurar ambiente e job no DBT Cloud
- Em **"Deploy" > "Environments"**, crie um novo *Environment* (ex: "prod")
- Em **"Deploy" > "Jobs"**, crie um *Job* com o comando:
  """
  dbt build
  """

### 📓 3. Configurar Notebooks no Databricks
- No Databricks, importe os notebooks do diretório "Databricks_Notebooks":
  - "01_EXTRACT.sql"
  - "02_INGEST.sql"
  - "03_CALL_DBT_API.py"
- Acesse a aba **Workspace > Import** e selecione os arquivos ".sql" ou ".py".

### 🗂️ 4. Criar estrutura de destino no Databricks
- Crie um **catalog** chamado "adventureworks"  
- Dentro dele, crie um **schema** chamado "ingest"
- Dentro do schema, crie um **volume** chamado "raw"

> ⚠️ Esses nomes são opcionais, mas caso altere, você precisará atualizar os caminhos nos notebooks.

### 🔑 5. Preencher credenciais nos notebooks
- Abra os notebooks e preencha as variáveis com:
  - URLs do SQL Server
  - Credenciais de conexão
  - Token e host do Databricks
- Todos os trechos estão comentados para facilitar o preenchimento.

### ⏱️ 6. Criar Job de orquestração no Databricks
- Vá até **"Jobs & Pipelines" > "Create Job"**
- Adicione os notebooks na seguinte ordem:
  1. "EXTRACT"
  2. "INGEST"
  3. "CALL_DBT_API"

---

## 📁 Estrutura do Repositório

"""
DBT_AW/
│
├── Databricks_Notebooks/
│   ├── 01_EXTRACT.ipynb
│   ├── 02_INGEST.ipynb
│   └── 03_CALL_DBT_API.ipynb
│
├── models/
│   ├── stg/        → Camada de staging
│   ├── int/        → Camada intermediária
│   └── marts/      → Fatos e dimensões
│
├── dbt_project.yml → Configurações do projeto DBT
└── README.md       → Este arquivo
