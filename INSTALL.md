# financial

Resposta ao [desafio 1 da Myfreecomm](https://github.com/myfreecomm/desafio-programacao-1)

Esta aplicação está rodando no Heroku, com monitoração via NewRelic.

<http://desafio1.herokuapp.com>

O código está disponível em: <http://github.com/tinogomes/desafio1-programacao-1>

## Preparar ambiente de desenvolvimento

### Requisitos

1. Ruby 1.9.3
1. Bundler >= 1.3.5
1. PostgreSQL em produção

### Passos 

1. baixe o código
1. entre no diretório da aplicação
1. instalar as gems: `bundle install`
1. configurar acesso ao banco no arquivo `config/database.yml`
1. criar o banco: `rake db:create db:migrate`
1. execute os testes para verificar se está tudo OK. `rake spec`
