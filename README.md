# Banco de Dados - Escola de Música

Este repositório contém:

- `schema.sql` – Estrutura completa do banco de dados (SQLite)
- `inserts.sql` – Alimentação com dados de exemplo
- `consultas.sql` – Consultas exigidas no trabalho (simples, média e complexa)
- `escola_musica.db` – Banco SQLite pronto para uso

## Como rodar

```bash
sqlite3 escola_musica.db
.read schema.sql
.read inserts.sql
