*** Settings ***
Documentation     Testes de busca e navegação na Amazon BR
Resource          ../resources/resource1.robot
Suite Setup       Abrir site
Suite Teardown    Close All Browsers
Test Teardown     Capture Page Screenshot


*** Test Cases ***
Abrir home
    [Tags]    smoke
    Wait Until Element Is Visible    ${SEARCH_BOX}    ${DEFAULT_TIMEOUT}

Buscar: Celulares
    [Tags]    busca
    Pesquisar termo          Celulares
    Deve exibir resultados

Buscar: Notebooks
    [Tags]    busca
    Pesquisar termo          Notebooks
    Deve exibir resultados

Ordenar por menor preço (SSD)
    [Tags]    ordenacao
    Pesquisar termo          SSD
    Deve exibir resultados
    Selecionar ordenação    Preço: Do menor para o maior
    Deve exibir resultados

Paginação de resultados (Monitor)
    [Tags]    paginacao
    Pesquisar termo          Monitor
    Deve exibir resultados
    Navegar para próxima página de resultados
    Deve exibir resultados

