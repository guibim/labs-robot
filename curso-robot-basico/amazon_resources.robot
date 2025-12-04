*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://www.amazon.com.br
${MENU_OFFERS}    xpath=//a[contains(@href, "/deals")]
${SEARCH_FIELD}   id=twotabsearchtextbox
${PRODUCT_NAME}   Xbox Series S
${SEARCH_BUTTON}  id=nav-search-submit-button

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fechar navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${MENU_OFFERS}    10s

Entrar no menu Ofertas do dia
    Click Element    ${MENU_OFFERS}

Verificar se aparece a palavra "Ofertas e Promoções"
    Page Should Contain    Ofertas e Promoções

Verificar se o título da página fica "Ofertas e Promoções"
    Title Should Be    Ofertas e Promoções | Amazon.com.br

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Wait Until Element Is Visible    ${SEARCH_FIELD}    10s
    Input Text    ${SEARCH_FIELD}    ${PRODUCT_NAME}
    Click Element    ${SEARCH_BUTTON}

Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Page Should Contain    ${PRODUCT_NAME}
