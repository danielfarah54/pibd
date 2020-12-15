-- Restrições da etapa 3
/* 

rem Restrição 2: uma pessoa só pode ser apagada se a mesma não tiver amizade com ninguém. 
rem Observe todas amizades:
select * from temAmizade;
/
rem Tenta deletar a pessoa com código igual a 111.
delete from pessoa where codigo = 111;
/
rem Remove as amizades das pessoas com código igual a 111.
delete from temAmizade where codigoPessoa = 111 or codigoAmiga = 111;
/
rem Restrição 3: faça que ao apagar uma pessoa no banco, todos os relacionamentos com os seus carros e seus carros sejam apagados.
rem Observe a tabela de posse sobre um carro:
select * from possui
/
rem Tenta remover novamente a pessoa com código igual a 111.
delete from pessoa where codigo = 111;
/
rem Observe que as posses foram removidas.
select * from possui;
/
rem Entretanto o carro não foi, outra pessoa também possui posse sobre este carro.
select * from carro;
/
rem Remove a última pessoa que possui posse sobre o carro em questão.
delete from pessoa where codigo = 444;
/
rem Exibe todas as relações de posse.
select * from possui;
/
rem Observe que o carro em questão foi removido pois ninguém o possui.
select * from carro
/

*/
-- Fim das restrições da etapa 3