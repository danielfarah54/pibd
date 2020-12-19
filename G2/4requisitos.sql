-- Restrições da etapa 3

-- Restrição 2: uma pessoa só pode ser apagada se a mesma não tiver amizade com ninguém. 
-- Observe todas amizades:
select * from temAmizade;

-- Tenta deletar a pessoa com código igual a 111.
-- delete from pessoa where codigo = 111; -- AQUI DEVE ACUSAR ERRO, DESCOMENTE PARA CONFERIR

-- Remove as amizades das pessoas com código igual a 111.
delete from temAmizade where codigo_pessoa = 111 or codigo_amiga = 111;

-- Restrição 3: faça que ao apagar uma pessoa no banco, todos os relacionamentos com os seus carros e seus carros sejam apagados.
-- Observe a tabela de posse sobre um carro:
select * from possui;

-- Tenta remover novamente a pessoa com código igual a 111.
delete from pessoa where codigo = 111;

-- Observe que as posses foram removidas.
select * from possui;

-- Entretanto o carro não foi, outra pessoa também possui posse sobre este carro.
select * from carro;

-- Remove a última pessoa que possui posse sobre o carro em questão.
delete from pessoa where codigo = 444;

-- Exibe todas as relações de posse.
select * from possui;

-- Observe que o carro em questão foi removido pois ninguém o possui.
select * from carro;

-- Fim das restrições da etapa 3
-- Restricoes da etapa 4

-- Requisito 1
-- Gera o codigo automaticamente
SELECT MAX(codigo) FROM pessoa;
SELECT gera_codigo_pessoa();

-- Requisito 2, 9, 11, 12
-- Adicionado em 1create.sql e 2triggerANDprocedures.sql
-- Observe o numero de amigos e carros antes e depois da remocao
SELECT codigo, pnome, num_amigos, num_carros
FROM pessoa;

DELETE FROM temAmizade WHERE codigo_pessoa = 2 OR codigo_amiga = 2;
DELETE FROM possui WHERE codigo = 2;

SELECT codigo, pnome, num_amigos, num_carros
FROM pessoa;

DELETE FROM pessoa WHERE codigo = 2;

SELECT codigo, pnome, num_amigos, num_carros
FROM pessoa;

-- Requisito 4
SELECT * FROM pessoa WHERE codigo = 10;
CALL altera_pessoa(10, 'Jhonny', 'Silverhand', current_date, 'cyber@punk.com', NULL, '99775-954', '2077', 'Night City');
SELECT * FROM pessoa WHERE codigo = 10;

SELECT * FROM carro WHERE placa = 'GVZ9079'; 
CALL altera_carro('GVZ9079', 1908, 'Preto', 'Model T');
SELECT * FROM carro WHERE placa = 'GVZ9079'; 

SELECT * FROM telefone WHERE codigo = 10;
CALL altera_telefone(10, 16, 9, 38264321);
SELECT * FROM telefone WHERE codigo = 10;

-- REQUISITO 7
SELECT get_nome(10);
