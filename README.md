![example workflow](https://github.com/danielnottingham/SMRT/actions/workflows/ci.yml/badge.svg)

## Requerimentos:
- Ruby 3.2.2
- Node 20.7.0

#### Defina as credenciais do banco no seu arquivo .env
```
POSTGRES_HOST=**seu_host**
POSTGRES_USER=**usuário_de_acesso**
POSTGRES_PASSWORD=**sua_senha**
POSTGRES_PORT=**porta_do_baco**
```
#### CI
- **Para as variáveis secretas do github actions:**
- Settings > Secrets and variables > New repository
- E da mesma maneira defina as variáveis necessárias. 
```
# Como definir:
POSTGRES_HOST=**seu_host**

# Como utilizar no arquivo do ci.yml:
${{ secrets.POSTGRES_HOST }}
```

---
## Linters:
- gem: [rubocop](https://github.com/rubocop/rubocop)
- gem: [erb-lint](https://github.com/Shopify/erb-lint)

```
# Para executar o rubocop:
bundle exec rubocop

# Para executar o erb-lint:
bundle exec erblint --lint-all

# Para executar o lint do yarn
yarn lint

# Para executar todos juntos:
bin/lint
```
---
## Scan:
- gem: [brakeman](https://github.com/presidentbeef/brakeman)
```
# Para executar:
bundle exec brakeman

# Ou:
bin/scan
```
