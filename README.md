# pibd
Repositório para atividades da disciplina Projeto e Implementação de Banco de Dados (2020)

## Trabalho 2
### Requisitos:
1. ~~Crie uma sequência para o código da pessoa.~~
2. ~~Altere a tabela da pessoa adicionando um atributo que conta o número de carros da pessoa, e adicionando um atributo que conta o número de amigos da pessoa. Ambos os atributos devem ser inteiros.~~
3. Faça um procedimento para cada tabela de seu esquema relacional para que permita a inserção de dados.
4. ~~Faça um procedimento para cada tabela de seu esquema relacional para que permita a alteração de dados.~~
5. Faça uma trigger que use sequências para a inserção das chaves das tuplas de pessoa (disparar antes de inserção na tabela pessoa).
6. Faça no mínimo 10 inserts para cada tabela utilizando as procedures criadas.
7. ~~Faça uma função que retorne o nome da pessoa.~~
8. Faça uma função que retorne o número de amigos que ela possui.
9. ~~Faça um procedimento que atualize os atributos número de amigos de acordo com as informações presentes no banco~~
10. Faça um procedimento que atualize o número de pessoas de acordo com as informações presentes no banco.
11. ~~Faça um trigger que atualize automaticamente o número de amigos quando a mesma fizer uma nova amizade ou quando desfizer alguma amizade.~~
12. ~~Faça um trigger que atualize automaticamente o número de carros da pessoa,  quando a mesma tiver mais um carro ou quando vencder um carro.~~
13. Faça uma view que retorne todas os nomes das pessoas que não tem amigos.
14. Faça uma view que retorne o nome das pessoas que tem o carro modelo ‘Jaguar’ e dos seus amigos.

### Obrigatório utilizar:
1. Em pelo menos uma procedure/function utilizar um cursor implícito.
2. Em pelo menos uma procedure/function utilizar um cursor explícito.
3. Em pelo menos uma procedure/function utilizar um cursor explícito parmetrizado.
4. Construir uma situação para a qual seja interessante a passagem de um cursor como parâmetro.

## Instruções
### Para executar os arquivos:
1. Verifique se está na versão mais recente do repositório através do comando: git pull
1. Execute em sequência:
   1. 1create.sql
   2. 2triggerANDprocedure.sql
   3. 3popula.sql
   4. 4requisitos.sql
