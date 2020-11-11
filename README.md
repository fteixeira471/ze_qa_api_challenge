# **Projeto de Testes Automatizados**

Olá!

Este é um projeto para testes automatizados da API OpenWeatherMap!

## **Tecnologias Utilizadas**
* **Python**
* **RobotFramework**
* **RequestsLibrary**
* **FakerLibrary**
* **JSONSchemaLibrary**

## **Ferramentas Necessárias**
* **Python (versão 3.7.9)** - <https://realpython.com/installing-python>
* **Git Client** - <https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git>

## **Preparando o Ambiente**
Após a instalação das **Ferramentas Necessárias**, abra o terminal e execute os comandos a seguir:
```
> 1. Clonar o projeto de automação

git clone https://github.com/fteixeira471/ze_qa_api_challenge.git

------------------------------------------

> 2. Acessar a pasta do projeto

cd ze_qa_api_challenge

------------------------------------------
> 3. Instalar o **pipenv** para posterior criação de ambiente virtual e instalação das dependências do projeto

python3 -m pip install pipenv

------------------------------------------
> 4. Ativar ambiente virtual

python3 -m pipenv shell

------------------------------------------
> 5. Instalar dependências

pipenv install
```

## **Executando a Automação**
Ainda no terminal e dentro da pasta raiz do projeto (_ze_qa_api_challenge_):
```
> Para executar todos os testes:
robot -d ./results atests

> Para executar um cenário de teste específico:
robot -d ./results -i city_name atests
robot -d ./results -i zipcode atests
```

* **para fechar o ambiente virtual, execute o comando ```exit``` no terminal**
* **efetue passo 4 do tópico "Preparando o Ambiente" se desejar executar os testes novamente**



## **Organização dos Reports**
Em toda a execução dos testes são gerados relatórios tanto no terminal quanto em arquivos html/xml. Para manter a organização desses arquivos e não poluir a pasta raiz do projeto, é importante informar o parâmetro "```-d ./results```" (_conforme os exemplos no tópico acima_). Deste modo, as evidências serão armazenadas conforme a estrutura abaixo:
```
ze_qa_api_challenge
└── results
    ├── log.html
    ├── output.xml
    └── report.html
```