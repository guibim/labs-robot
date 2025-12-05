*** Settings ***

Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***

Criar um usuario novo
    ${palavra_aleatoria}  Generate Random String    4   chars=[LETTERS]
    ${palavra_aleatoria}  Convert to Lower Case     ${palavra_aleatoria}
    Log    Minha Palavra Aleatória é: ${palavra_aleatoria}$emailteste.com
    Set Test Variable    ${EMAIL_TESTE}   ${palavra_aleatoria}@emailteste.com
    Log    $EMAIL_TESTE

Cadastrar o usuário criado na ServeRest
   [Arguments]    ${email}    ${status_code_desejado}
    ${body}=    
    ...    Create Dictionary    
    ...    nome=Usuario de teste    
    ...    email=${email}    
    ...    password=1234   
    ...    administrador=true
    Log    ${body}

    Criar Sessão na ServeRest

    ${resposta}=    POST On Session
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}

    Log    ${resposta.json()}
    Log    Status Code: ${resposta.status_code}
    Log    Response Text: ${resposta.text}

    ${json}=    Set Variable    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${json}

    # Só salva o ID se for cenário de criação (201)
    Run Keyword If    '${status_code_desejado}' == '201'
    ...    Set Test Variable    ${ID_USUARIO}    ${json["_id"]}


Criar Sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}
    
Conferir se o usuário foi cadastrado corretamente (201)
    Log    ${RESPOSTA}
    Dictionary Should Contain Item  ${RESPOSTA}  message   Cadastro realizado com sucesso
    Dictionary Should Contain Key  ${RESPOSTA}  _id

Vou repetir o cadastro de usuário
    Cadastrar o usuário criado na ServeRest  ${EMAIL_TESTE}  status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item  ${RESPOSTA}  message   Este email já está sendo usado
    
    
Consultar os dados do novo usuário
    ${resposta_consulta}  GET On Session
    ...    alias=ServeRest
    ...    url=/usuarios/${ID_USUARIO}
    ...    expected_status=200
    Set Test Variable    ${RESPOSTA_CONSULTA}    ${resposta_consulta.json()}
    
Conferir os dados retornados
    Log  ${RESPOSTA_CONSULTA}
    Dictionary Should Contain Item  ${RESPOSTA_CONSULTA}  nome   Usuario de teste
    Dictionary Should Contain Item  ${RESPOSTA_CONSULTA}  email   ${EMAIL_TESTE}
    Dictionary Should Contain Item  ${RESPOSTA_CONSULTA}  password  1234
    Dictionary Should Contain Item  ${RESPOSTA_CONSULTA}  administrador   true
    Dictionary Should Contain Item  ${RESPOSTA_CONSULTA}  _id  ${ID_USUARIO}