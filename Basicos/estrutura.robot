*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${URL}    https://www.techlistic.com/p/selenium-practice-form.html
${BROWSER}    Chrome
${input_fname}  name:firstname 
${input_lname}  name:lastname
${gender_male}  id:sex-0
${experience}  id:exp-0
${date}  id:datepicker
${profession_manual}  id:profession-0
${profession_automation}  id:profession-1
${auto_tools}  id:tool-2
${continent_dropdown}    id:continents
${continent_option}      South America
${input_file}     id:photo
${submit}    id:submit

*** Keywords ***
abrir navegador e acessar o site
    Open Browser    ${URL}    ${BROWSER}

preencher campos
    Input Text    ${input_fname}    Guilherme
    Input Text    ${input_lname}    Bim
    Click Element    ${gender_male}
    Click Element    ${experience}
    Input Text    ${date}    15/10/2025
    Click Element    ${profession_manual}
    Click Element    ${profession_automation}
    Click Element    ${auto_tools}
    Select From List By Label    ${continent_dropdown}    ${continent_option}
    Choose File    ${input_file}    E:/Downloads - E/test/image.jpg
    Click Element    ${submit}

Validar o DownloadFile
    Create Session    github    https://github.com
    ${response}=    GET On Session    github    /stanfy/behave-rest/blob/master/features/conf.yaml
    Log To Console   \nStatus: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200

espere 5 segundos
    Sleep    5s

Fecha o navegador
    Close Browser

*** Test Cases ***
Cenário 1: Preenchendo formulário
    abrir navegador e acessar o site
    preencher campos
    Validar o DownloadFile
    Espere 5 segundos
    Fecha o navegador
