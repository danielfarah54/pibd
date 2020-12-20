



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
-- Altera dados de pessoa, carro e telefone (telefone cria um novo caso nao exista)
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
-- Retorna o nome de uma pessoa
SELECT get_nome(10);

-- REQUISITO 8
-- Conta os amigos de uma pessoa
SELECT codigo, num_amigos FROM pessoa;
CALL insere_amizade(222, 333);
SELECT conta_amigos(333);

-- REQUISITO 13
-- Retorna todas pessoas sem amziades :(
SELECT * FROM v_pessoas_sem_amigos;

-- REQUISITO 3
SELECT * FROM pessoa WHERE codigo = 11;
CALL insere_pessoa(11, 'daniel', 'farah', '08-03-1991', 'daniel@teste.com', 'danielfarah.com', '13333444', 13, 'rua 34');
SELECT * FROM pessoa WHERE codigo = 11;

SELECT * FROM carro WHERE placa = 'ccc3333';
CALL insere_carro ('ccc3333', 2014, 'preto', 'golzinho bolinha');
SELECT * FROM carro WHERE placa = 'ccc3333';

SELECT * FROM telefone WHERE codigo = 11;
CALL insere_telefone (11, 16, 91111, 4444);
SELECT * FROM telefone WHERE codigo = 11;

SELECT * FROM possui WHERE codigo = 11;
CALL insere_possui (11, 'ccc3333');
SELECT * FROM possui WHERE codigo = 11;

-- REQUISITO 6
CALL insere_pessoa(12, 'daniel', 'farah', '08-03-1991', 'daniel@teste.com', 'danielfarah.com', '13333444', 13, 'rua 34');
CALL insere_pessoa(13, 'adilson', 'souza', '01-01-1991', 'adilson@teste.com', 'adilsonsouza.com', '13333444', 111, 'rua 11');
CALL insere_pessoa(14, 'bruna', 'oliveira', '02-02-1992', 'bruna@teste.com', 'brunaoliveira.com', '13333444', 222, 'rua 22');
CALL insere_pessoa(15, 'claudio', 'cortez', '03-03-1993', 'cortez@teste.com', 'cortez.com', '13333444', 333, 'rua 33');
CALL insere_pessoa(16, 'ellen', 'page', '04-04-1994', 'ellen@teste.com', 'ellen.com', '13333444', 444, 'rua 44');
CALL insere_pessoa(17, 'fabio', 'fagundes', '05-05-1995', 'fagundao@teste.com', 'ffagundes.com', '13333444', 555, 'rua 55');
CALL insere_pessoa(18, 'gabriela', 'alem', '06-06-1996', 'alem@teste.com', 'alemdela.com', '13333444', 666, 'rua 66');
CALL insere_pessoa(19, 'heloisa', 'ramos', '07-07-1997', 'heloramos@teste.com', 'hellohelo.com', '13333444', 777, 'rua 77');
CALL insere_pessoa(20, 'icaro', 'silva', '08-08-1998', 'souzaicaro@teste.com', 'icarosouza.com', '13333444', 888, 'rua 88');
CALL insere_pessoa(21, 'jesus', 'amado', '09-09-1999', 'ohlord@teste.com', 'hollyloved.com', '13333444', 999, 'rua 99');

CALL insere_carro ('aaa1111', 2011, 'preto', 'golzinho bolinha');
CALL insere_carro ('bbb2222', 2012, 'preto', 'golzinho bolinha');
CALL insere_carro ('ccc3333', 2013, 'preto', 'golzinho bolinha');
CALL insere_carro ('ddd4444', 2014, 'preto', 'golzinho bolinha');
CALL insere_carro ('eee5555', 2015, 'preto', 'golzinho bolinha');
CALL insere_carro ('fff6666', 2016, 'preto', 'golzinho bolinha');
CALL insere_carro ('ggg7777', 2017, 'preto', 'golzinho bolinha');
CALL insere_carro ('hhh8888', 2018, 'preto', 'golzinho bolinha');
CALL insere_carro ('iii9999', 2019, 'preto', 'golzinho bolinha');
CALL insere_carro ('jjj1010', 2020, 'preto', 'golzinho bolinha');

CALL insere_telefone (12, 16, 91111, 4444);
CALL insere_telefone (13, 16, 92222, 4444);
CALL insere_telefone (14, 16, 93333, 4444);
CALL insere_telefone (15, 16, 94444, 4444);
CALL insere_telefone (16, 16, 95555, 4444);
CALL insere_telefone (17, 16, 96666, 4444);
CALL insere_telefone (18, 16, 97777, 4444);
CALL insere_telefone (19, 16, 98888, 4444);
CALL insere_telefone (20, 16, 99999, 4444);
CALL insere_telefone (21, 16, 91010, 4444);

CALL insere_possui (12, 'aaa1111');
CALL insere_possui (13, 'bbb2222');
CALL insere_possui (14, 'ccc3333');
CALL insere_possui (15, 'ddd4444');
CALL insere_possui (16, 'eee5555');
CALL insere_possui (17, 'fff6666');
CALL insere_possui (18, 'ggg7777');
CALL insere_possui (19, 'hhh8888');
CALL insere_possui (20, 'iii9999');
CALL insere_possui (21, 'jjj1010');