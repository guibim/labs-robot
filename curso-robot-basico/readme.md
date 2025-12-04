# Automação de Testes com Robot Framework – Amazon.com.br

Este repositório contém exercícios práticos realizados durante o curso  
**“Automação de Testes com Robot Framework – Básico”** da Mayara “May” Fernandes (Udemy).

O objetivo é praticar:
- Uso do Robot Framework
- SeleniumLibrary
- Criação de keywords reutilizáveis
- Estrutura de testes simples
- Navegação e busca no site Amazon.com.br

## 📂 Arquivos principais
- **amazon_resources.robot** → Variáveis e keywords (abrir navegador, acessar página, buscar produto etc.)
- **tests.robot** → Testes tradicionais
- **tests_bdd.robot** → Versão dos mesmos testes no estilo BDD (Given/When/Then)

## 🧪 Casos de teste implementados

### ✔️ Caso de Teste 1 — Acessar “Ofertas do Dia”
- Acessa a home
- Entra no menu *Ofertas do Dia*
- Verifica o título da página
- Verifica o texto “Ofertas e Promoções”

### ✔️ Caso de Teste 2 — Buscar um produto
- Acessa a home
- Digita “Xbox Series S” no campo de busca
- Verifica se o produto aparece nos resultados

## ▶️ Como executar
Pré-requisitos:
- Python instalado
- Robot Framework + SeleniumLibrary instalados  
  ```bash
  pip install robotframework seleniumlibrary
Para rodar os testes:

bash
Copiar código
robot tests.robot
Ou versão BDD:

bash
Copiar código
robot tests_bdd.robot
