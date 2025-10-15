*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.amazon.com.br
${BROWSER}    chrome

*** Keywords ***
Acessar a pagina inicial do Amazon
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:twotabsearchtextbox    10s

Pesquisar por Celulares
    Input Text    id:twotabsearchtextbox    Celulares
    Click Button  id:nav-search-submit-button

Validar o resultado
    Wait Until Page Contains Element    css:[data-component-type="s-search-result"]    10s
    Page Should Contain Element         css:[data-component-type="s-search-result"]
