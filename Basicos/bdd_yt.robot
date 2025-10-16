*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Dados do teste
${NomeDoVideo}    Lo-Fi

# Variáveis de Configuração
${URL}    https://www.youtube.com/
${Browser}    Chrome

# Elementos
${Lupa}    xpath=//button[@class='ytSearchboxComponentSearchButton ytSearchboxComponentSearchButtonDark']
${BarraDePesquisa}    xpath=//input[@class='ytSearchboxComponentInput yt-searchbox-input title']
${PrimeiroVideo}    xpath=(//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${VideoEmExecucao}    xpath=//h1//yt-formatted-string[@class='style-scope ytd-watch-metadata']

*** Keywords ***
que acesso o site do Youtube
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

digito na barra de pesquisa "Lo-Fi" e clico na lupa
    Input Text    ${BarraDePesquisa}    ${NomeDoVideo}
    Click Element    ${Lupa}
    Sleep    3s

clico no primeiro vídeo que aparece
    Click Element    ${PrimeiroVideo}
    Sleep    3s

o vídeo começa a ser executado
    Element Should Be Visible    ${VideoEmExecucao}
    Sleep    3s
    Close Browser

*** Test Cases ***
Cenário 1: Executar vídeo do Youtube
    Given que acesso o site do Youtube
    When digito na barra de pesquisa "Lo-Fi" e clico na lupa
    And clico no primeiro vídeo que aparece
    Then o vídeo começa a ser executado