# Teste ZRP - Pokémon
## Sobre o teste

Uma api que consuma a pokeapi e faça:
- Dado um nome de pokémon, retornar suas habilidades em orden alfabética.


## Como rodar
Para rodar, tem que ter uma versão do Ruby compatível com o Gemfile:
```
bundle install
rails s
```

## Request
A url para fazer o `get` da habilidades segue o exemplo: http://127.0.0.1:3000/v1/pokemon/info/ditto
obs: pode passar o nome do pokémon ou seu número da pokedex, por exemplo http://127.0.0.1:3000/v1/pokemon/info/charmander ou http://127.0.0.1:3000/v1/pokemon/info/4

## Testes
Para rodar os testes, rode `rspec`, assumindo que rodou anteriormente o `bundle install`.
Para checar a cobertura de testes, abra o arquivo `index.html` que se encontra dentro da pasta `coverage`

## Arquitetura
A ideia da arquitetura foi inspirada em ideias de SOLID e Clean Architecture, mas especificamente em Ports & Adapters.
- Adapters: É a camada responsável por adaptar a entrada e saída de dados baseado numa estrutura pré definida. Além disso nele está algumas validações de entradas para assegurar que está sendo respeitada a estrutura esperada, por exemplo no adapter da porta de entrada estamos ajustando as string maiúsculas e no adapter de saída estamos retornando apenas as habilidades que a pokeapi nos dá. Caso seja desajado receber mais informações além das habilidades, basta modificar esse adapter de saída.
- Controller: Seria nossa camada de aplicação, define como o mundo externo interage com a nossa aplicação.
- Service: Seria o Core da nossa API, nela estará as lógicas e regras de negócio
- Communication: Camada que criei para servir como a camada de infra, nela está nosso rest_client e o nosso componente de interação com a pokeapi