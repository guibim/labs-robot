*** Settings ***
Documentation    Suite BDD (Gherkin-style) que testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar navegador

*** Test Cases ***
CT 1 - Acesso ao menu "Ofertas do dia" (BDD)
    [Documentation]  Cenário: acessar o menu "Ofertas do dia" e validar título e texto da página.
    [Tags]           bdd   menus   categorias
    Given Acessar a home page do site Amazon.com.br
    When Entrar no menu Ofertas do dia
    Then Verificar se o título da página fica "Ofertas e Promoções"
    And Verificar se aparece a palavra "Ofertas e Promoções"


CT 2 - Pesquisa de um produto "Xbox Series S" (BDD)
    [Documentation]  Cenário: pesquisar o produto "Xbox Series S" e validar se ele aparece nos resultados.
    [Tags]           bdd   busca_produtos   lista_busca
    Given Acessar a home page do site Amazon.com.br
    When Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Then Verificar o resultado da pesquisa se esta listando o produto pesquisado
