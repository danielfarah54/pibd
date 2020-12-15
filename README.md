# pibd
Repositório para atividades da disciplina Projeto e Implementação de Banco de Dados (2020)

## Trabalho 2
ROADMAP:
1. Crie uma sequência para o código da pessoa.
2. Altere a tabela da pessoa adicionando um atributo que conta o número de carros da pessoa, e adicionando um atributo que conta o número de amigos da pessoa. Ambos os atributos devem ser inteiros.
3. Faça um procedimento para cada tabela de seu esquema relacional para que permita a inserção de dados.
4. Faça um procedimento para cada tabela de seu esquema relacional para que permita a alteração de dados.
5. Faça uma trigger que use sequências para a inserção das chaves das tuplas de pessoa (disparar antes de inserção na tabela pessoa).
6. Faça no mínimo 10 inserts para cada tabela utilizando as procedures criadas.
7. Faça uma função que retorne o nome da pessoa.
8. Faça uma função que retorne o número de amigos que ela possui.
9. Faça um procedimento que atualize os atributos número de amigos de acordo com as informações presentes no banco
10. Faça um procedimento que atualize o número de pessoas de acordo com as informações presentes no banco.
11. Faça um trigger que atualize automaticamente o número de amigos quando a mesma fizer uma nova amizade ou quando desfizer alguma amizade.
12. Faça um trigger que atualize automaticamenteo número de carros da pessoa,  quando a mesma tiver mais um carro ou quando vencder um carro.
13. Faça uma view que retorne todas os nomes das pessoas que não tem amigos.
14. Faça uma view que retorne o nome das pessoas que tem o carro modelo ‘Jaguar’ e dos seus amigos.

### Requisitos
1. Em pelo menos uma procedure/function utilizar um cursor implícito.
2. Em pelo menos uma procedure/function utilizar um cursor explícito.
3. Em pelo menos uma procedure/function utilizar um cursor explícito parmetrizado.
4. Construir uma situação para a qual seja interessante a passagem de um cursor como parâmetro.

## Instruções
### Para executar os arquivos:
1. Verifique se está na versão mais recente do repositório através do comando: git pull
1. Acesse a pasta do trabalho em questão
5. Acesse o arquivo nome_do_arquivo.sql
6. Opções:
   - Copie o conteúdo do arquivo -> cole em SQL Worksheet
   - Em My Scripts -> Upload Script -> Coloque o arquivo (CUIDADO: dependendo do estao de nome_do_arquivo.sql pode ser que existam erros, em caso positivo, tente a outra anterior)
   - Vc pode salvar esta sessão para não precisar fazer isso toda vez que queira reiniciar o sistema
4. Comece uma nova sessão em [sql.oracle.com](sql.oracle.com/) 
    4. My Session -> Reset Session (assinale todas opões possíveis)
5. Execute consultas em SQL Worksheet (adicione comentários sempre que possível)
6. As consultas ficam salvas (temporariamente até reiniciar a sessão ou por logout) na sessão atual
8. Atualize nome_do_arquivo.sql com suas adições/alterações/remoções
8. Repita os passos anteriores (3 a 7) para verificar que suas alterações funcionam para todos os usuários
9. Se tudo funciona como esperado, realize commit e push

### Executando o projeto:
Para criação de tabelas, procedures, trigger, etc. e para popular as tabelas: utilize o arquivo create.sql

### Verifique as restrições
Para verificar os requisitos: 
1. Execute o arquivo create.sql
2. Utilize o arquivo requisitos.sql
3. Selecione as restrições que deseja verificar
4. Execute 
