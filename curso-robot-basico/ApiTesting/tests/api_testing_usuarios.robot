*** Settings ***
Resource     ../resources/api_testing_usuarios.resource

*** Variables ***


*** Test Cases ***

Cenário 01: Cadastrar um novo usuário com sucesso na ServRest
    Criar um usuario novo
    Cadastrar o usuário criado na ServeRest  ${EMAIL_TESTE}  status_code_desejado=201
    Conferir se o usuário foi cadastrado corretamente (201)

Cenário 02: Tentar cadastrar um usuário já existente
    Criar um usuario novo
    Cadastrar o usuário criado na ServeRest  ${EMAIL_TESTE}  status_code_desejado=201
    Vou repetir o cadastro de usuário
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um novo usuário
    Criar um usuario novo
    Cadastrar o usuário criado na ServeRest  ${EMAIL_TESTE}  status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados
