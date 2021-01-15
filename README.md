# Projeto e Implementação de Banco de Dados
Repositório para atividades da disciplina Projeto e Implementação de Banco de Dados (ENPE/2020)

## Trabalho 2 - Grupo 04
### Participantes da Etapa 04:
* Daniel Farah (417513)
* Felipe Francisco Berreta (422649)
* Marco Antonio B. Grivol (758619)
* Pedro Henrique Grespan Carneiro (761029)

### Instruções
1. Verifique se está na versão mais recente do repositório através do comando "git pull".
2. Crie um novo banco de dados no pgAdmin4 chamado "pibd".
3. Execute em sequência:
    1. 1create.sql
    2. 2triggerANDprocedure.sql
    3. 3popula.sql
    4. 4requisitos.sql
4. Abra o projeto em uma IDE (Eclipse preferencialmente).
5. Se necessário, altere as informações de login no arquivo Tela.java (este projeto utiliza postgres como usuario e senha padrões).
6. Execute o arquivo Tela.java.

### Exemplos
1. Consulta:
	1. carro
	2. pessoa
	3. possui
	4. telefone
	5. temAmizade
2. Inserção:
	1. carro: placa, modelo, ano, cor
	2. pessoa: nome, sobrenome, data de nascimento (aaaa-dd-mm), email, homepage, cep, número da rua, nome da rua
	3. possui: código da pessoa, placa
	4. telefone: código da pessoa, ddd, prefixo, número
	5. temAmizade: código da pessoa, código da amiga, data da amizade (aaaa-dd-mm)