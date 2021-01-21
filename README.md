# Projeto e Implementa��o de Banco de Dados
Reposit�rio para atividades da disciplina Projeto e Implementa��o de Banco de Dados (ENPE/2020)

## Trabalho 2 - Grupo 04
* Daniel Farah (417513)
* Felipe Francisco Berreta (422649)
* Marco Antonio B. Grivol (758619)
* Pedro Henrique Grespan Carneiro (761029)

### Instru��es
1. Verifique se est� na vers�o mais recente do reposit�rio atrav�s do comando "git pull".
2. Crie um novo banco de dados no pgAdmin4 chamado "pibd".
3. Acesse o diret�rio "scripts" e execute em sequ�ncia:
    1. 1create.sql
    2. 2triggerANDprocedure.sql
    3. 3popula.sql (opcional)
    4. 4requisitos.sql (opcional)
4. Abra o projeto em uma IDE (Eclipse preferencialmente).
5. Se necess�rio, altere as informa��es de login no arquivo Credentials.java (este projeto utiliza postgres como usuario e senha padr�es).
6. Execute o programa.

### Exemplos
1. Consulta:
     2. pessoa
     3. pessoa codigo_pessoa
     1. carro
     2. carro codigo_pessoa
     4. possui
     4. possui codigo_pessoa
     5. telefone
     6. telefone codigo_pessoa
     7. temAmizade
     8. temAmizade codigo_pessoa
     
2. Inser��o:
     1. carro: placa, modelo, ano, cor
     2. pessoa: nome, sobrenome, data_nascimento (aaaa-dd-mm), email, homepage, cep, numero_rua, nome_rua
     3. possui: codigo_pessoa, placa
     4. telefone: codigo_pessoa, ddd, prefixo, numero
     5. temAmizade: codigo_pessoa, codigo_amiga, data_amizade (aaaa-dd-mm)