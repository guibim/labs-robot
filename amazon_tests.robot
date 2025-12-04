*** Settings ***
Documentation    Essa suit testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste 1 - Acesso ao menu "Ofertas do dia"
    [Documentation]  Esse teste verifica o acesso ao menu "Ofertas do dia" no site Amazon.com.br
    ...              E valida se o título da página e os elementos esperados estão presentes.
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu Ofertas do dia
    Verificar se o título da página fica "Ofertas e Promoções"
    Verificar se aparece a palavra "Ofertas e Promoções"


    

Caso de teste 2 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto pesquisado
