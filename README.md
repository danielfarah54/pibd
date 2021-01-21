# Projeto e Implementação de Banco de Dados

Repositório para atividades da disciplina Projeto e Implementação de Banco de Dados, do Departamento de Computação da UFSCar.

## Trabalho 2 - Grupo 04
* Daniel Farah (417513)
* Felipe Francisco Berreta (422649)
* Marco Antonio B. Grivol (758619)
* Pedro Henrique Grespan Carneiro (761029)

### Instruções
1. Verifique se está na versão mais recente do repositório através do comando "git pull".
2. Crie um novo banco de dados no pgAdmin4 chamado "pibd".
3. Acesse o diretório "scripts" e execute em sequência:
    1.  1create.sql
    2.  2triggerANDprocedure.sql
    3.  3popula.sql (opcional)
    4.  4requisitos.sql (opcional)
4. Abra o projeto em uma IDE (Eclipse preferencialmente).
5. Se necessário, altere as informações de login no arquivo Credentials.java (este projeto utiliza postgres como usuario e senha padrões).
6. Execute o programa.

### Exemplos
1. Consulta:
    1.  pessoa
    2.  pessoa codigo_pessoa
    3.  carro
    4.  carro codigo_pessoa
    5.  possui
    6.  possui codigo_pessoa
    7.  telefone
    8.  telefone codigo_pessoa
    9.  temAmizade
    10. temAmizade codigo_pessoa
     
2. Inserção:
    1.  carro: placa, modelo, ano, cor
    2.  pessoa: nome, sobrenome, data_nascimento (aaaa-dd-mm), email, homepage, cep, numero_rua, nome_rua
    3.  possui: codigo_pessoa, placa
    4.  telefone: codigo_pessoa, ddd, prefixo, numero
    5.  temAmizade: codigo_pessoa, codigo_amiga, data_amizade (aaaa-dd-mm)