# 🧪 BTCheck Tests — QA Automation Suite

Repositório dedicado à **automação de testes do projeto [BTCheck](https://github.com/guibim/btcheck)**.  
O objetivo deste ambiente é garantir a **confiabilidade, estabilidade e cobertura completa** das funcionalidades do portal, abrangendo desde a camada de API até os fluxos de interface.

---

## 🎯 Objetivo

Este projeto concentra os testes **E2E**, **de API**, **smoke**, **integração** e **unitários**, organizados de forma modular para facilitar a manutenção e a execução automatizada em pipelines CI/CD (GitHub Actions).

---

## 🧩 Estrutura de Testes

| Tipo de Teste | Ferramenta | Descrição |
|----------------|-------------|------------|
| **E2E (End-to-End)** | Robot Framework (Selenium) | Simula a jornada completa do usuário no site BTCheck. |
| **API Tests** | Robot Framework / Requests Library | Valida os endpoints principais (`/news.json`, `/api/by-date`, etc.). |
| **Smoke Tests** | Cypress | Verifica a disponibilidade e resposta básica do front-end e APIs. |
| **Integração** | Robot Framework | Garante a comunicação entre módulos (scraper, DB e JSON generator). |
| **Unit Tests** | Python (pytest) | Testa funções individuais dos scripts back-end (ex: `get_btc_price.py`). |

---
