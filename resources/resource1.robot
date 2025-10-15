*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${URL}                     https://www.amazon.com.br
${BROWSER}                 chrome
${DEFAULT_TIMEOUT}         25s
${RESULT_CARD}             css:div[data-component-type="s-search-result"]
${SEARCH_BOX}              id:twotabsearchtextbox
${SEARCH_SUBMIT}           id:nav-search-submit-button
${SORT_SELECT}             id:s-result-sort-select
${PAGINATION_NEXT}         css:a.s-pagination-next
${FIRST_TITLE_H2}    xpath=(//div[@data-component-type='s-search-result' and not(.//span[contains(.,'Patrocinado') or contains(.,'Sponsored')])]//h2)[1]
${FIRST_TITLE_LINK}  xpath=(//div[@data-component-type='s-search-result' and not(.//span[contains(.,'Patrocinado') or contains(.,'Sponsored')])]//h2//a)[1]


*** Keywords ***
Abrir site
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${SEARCH_BOX}    ${DEFAULT_TIMEOUT}

Pesquisar termo
    [Arguments]    ${termo}
    Wait Until Element Is Visible    ${SEARCH_BOX}    ${DEFAULT_TIMEOUT}
    Clear Element Text               ${SEARCH_BOX}
    Input Text                       ${SEARCH_BOX}    ${termo}
    Click Button                     ${SEARCH_SUBMIT}

Deve exibir resultados
    Wait Until Page Contains Element    ${RESULT_CARD}    ${DEFAULT_TIMEOUT}
    Page Should Contain Element         ${RESULT_CARD}

Selecionar ordenação
      [Arguments]    ${opcao}
    # Normaliza variações "ao" -> "para o"
    ${op}=    Set Variable    ${opcao}
    Run Keyword If    '${opcao}'=='Preço: Do menor ao maior'      Set Variable    ${op}    Preço: Do menor para o maior
    Run Keyword If    '${opcao}'=='Preço: Do maior ao menor'      Set Variable    ${op}    Preço: Do maior para o menor

    # Abre o dropdown 
    Wait Until Element Is Visible    xpath=//span[contains(@class,'a-button-text') and @data-action='a-dropdown-button']    ${DEFAULT_TIMEOUT}
    Scroll Element Into View         xpath=//span[contains(@class,'a-button-text') and @data-action='a-dropdown-button']
    Click Element                    xpath=//span[contains(@class,'a-button-text') and @data-action='a-dropdown-button']

    # Clica na opção do menu (âncora com classe a-dropdown-link)
    Wait Until Element Is Visible    xpath=//a[contains(@class,'a-dropdown-link') and normalize-space(.)='${op}']    ${DEFAULT_TIMEOUT}
    Click Element                    xpath=//a[contains(@class,'a-dropdown-link') and normalize-space(.)='${op}']

  
    Wait Until Page Contains Element    ${RESULT_CARD}    ${DEFAULT_TIMEOUT}

Validar página de produto
    Wait Until Page Contains Element    id:productTitle    ${DEFAULT_TIMEOUT}
    Page Should Contain Element         id:productTitle
    Run Keyword And Ignore Error        Page Should Contain Element    id:add-to-cart-button

Navegar para próxima página de resultados
    Wait Until Element Is Visible    ${PAGINATION_NEXT}    ${DEFAULT_TIMEOUT}
    Scroll Element Into View         ${PAGINATION_NEXT}
    Click Element                    ${PAGINATION_NEXT}
    Wait Until Page Contains Element    ${RESULT_CARD}    ${DEFAULT_TIMEOUT}

