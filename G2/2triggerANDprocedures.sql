-- Parte do REQUISITO 3 (Etapa 4)
-- Insere a amizade para as duas pessoas
CREATE OR REPLACE PROCEDURE insere_amizade
    (codigo_pessoa INTEGER, 
     codigo_amiga INTEGER, 
     data_amizade DATE DEFAULT CURRENT_DATE)
LANGUAGE SQL
AS $$
    insert into temAmizade
    values (codigo_pessoa, codigo_amiga, data_amizade);
    
    insert into temAmizade
    values (codigo_amiga, codigo_pessoa, data_amizade);
$$;

CREATE OR REPLACE FUNCTION verifica_existencia_amizade() RETURNS TRIGGER
LANGUAGE PLPGSQL 
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM temAmizade 
               WHERE codigo_pessoa = OLD.codigo OR  
                     codigo_amiga = OLD.codigo)
        THEN
            RAISE EXCEPTION 'ERRO! Pessoa ainda possui amizades';
    END IF;
    RETURN OLD; 
END;
$$;
DROP TRIGGER IF EXISTS t_bef_del_row_pessoa
    ON pessoa;
CREATE TRIGGER t_bef_del_row_pessoa
    BEFORE DELETE
    ON pessoa
    FOR EACH ROW
    EXECUTE PROCEDURE verifica_existencia_amizade();

-- Remove os carros, se possivel, e posse de uma pessoa
CREATE OR REPLACE FUNCTION remove_dependencia_pessoa() RETURNS TRIGGER
LANGUAGE PLPGSQL 
AS $$
DECLARE 
	placaCarro VARCHAR(8);
BEGIN         
    IF NOT EXISTS (SELECT 1 FROM possui WHERE placa = OLD.placa)
    THEN
        DELETE FROM carro WHERE placa = OLD.placa;
    END IF;
    RETURN OLD;
END;
$$;
DROP TRIGGER IF EXISTS t_aft_del_row_possui
    ON possui;
CREATE TRIGGER t_aft_del_row_possui
    AFTER DELETE
    ON possui
    FOR EACH ROW
    EXECUTE PROCEDURE remove_dependencia_pessoa();






-- ===== ETAPA 4 ===== 

-- REQUISITO 1: sequencia para o codigo de uma pessoa 
CREATE OR REPLACE FUNCTION gera_codigo_pessoa() RETURNS INTEGER 
LANGUAGE PLPGSQL
AS $$
DECLARE
	novo_codigo INTEGER;
BEGIN
	SELECT MAX(codigo)+1 INTO novo_codigo FROM pessoa;

   RETURN novo_codigo;
END; $$;






-- REQUISITO 2: implementado atraves do requisito 9 e 11
-- REQUISITO 9: atualiza numero de amigos
-- REQUISITO 11: atualiza o numero de amigos
-- trigger para quando insere em temAmizade
CREATE OR REPLACE FUNCTION conta_amigos_insert() RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
DECLARE
    n_amigos INTEGER;
BEGIN
    SELECT COUNT(*) INTO n_amigos
    FROM pessoa p, temAmizade ta
    WHERE p.codigo = NEW.codigo_pessoa AND
          ta.codigo_pessoa = NEW.codigo_pessoa; 

    UPDATE pessoa
    SET  num_amigos = n_amigos
    WHERE codigo = NEW.codigo_pessoa;

    RETURN NEW;
END; $$;

DROP TRIGGER IF EXISTS t_aft_inst_row_temAmizade_update_num
	ON temAmizade;
CREATE TRIGGER t_aft_inst_row_temAmizade_update_num
	AFTER INSERT
	ON temAmizade
	FOR EACH ROW
	EXECUTE PROCEDURE conta_amigos_insert();


-- -- trigger para quando remove em temAmizade
CREATE OR REPLACE FUNCTION conta_amigos_delete() RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
DECLARE
    n_amigos INTEGER;
BEGIN
    SELECT COUNT(*) INTO n_amigos
    FROM pessoa p, temAmizade ta
    WHERE p.codigo = OLD.codigo_pessoa AND
        ta.codigo_pessoa = OLD.codigo_pessoa; 

    UPDATE pessoa
    SET  num_amigos = n_amigos
    WHERE codigo = OLD.codigo_pessoa;
    RETURN NEW;
END; $$;

DROP TRIGGER IF EXISTS t_aft_del_row_temAmizade_update_num
	ON temAmizade;
CREATE TRIGGER t_aft_del_row_temAmizade_update_num
	AFTER DELETE
	ON temAmizade
	FOR EACH ROW
	EXECUTE PROCEDURE conta_amigos_delete();






-- REQUISITO 12: atualiza o numero de carros
-- trigger para quando insere em carros
CREATE OR REPLACE FUNCTION conta_carros_insert() RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
DECLARE
    n_carros INTEGER;
BEGIN
    SELECT COUNT(*) INTO n_carros
    FROM pessoa p, possui po
    WHERE p.codigo = NEW.codigo AND
          po.codigo = NEW.codigo; 

    UPDATE pessoa
    SET  num_carros = n_carros
    WHERE codigo = NEW.codigo;
    RETURN NEW;
END; $$;

DROP TRIGGER IF EXISTS t_aft_inst_row_possui_update_num
	ON possui;
CREATE TRIGGER t_aft_inst_row_possui_update_num
	AFTER INSERT
	ON possui
	FOR EACH ROW
	EXECUTE PROCEDURE conta_carros_insert();

-- -- trigger para quando remove em carros
CREATE OR REPLACE FUNCTION conta_carros_delete() RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
DECLARE
    n_carros INTEGER;
BEGIN
    SELECT COUNT(*) INTO n_carros
    FROM pessoa p, possui po
    WHERE p.codigo = OLD.codigo AND
        po.codigo = OLD.codigo; 

    UPDATE pessoa
    SET  num_carros = n_carros
    WHERE codigo = OLD.codigo;
    RETURN NEW;
END; $$;
DROP TRIGGER IF EXISTS t_aft_del_row_possui_update_num
	ON possui;
CREATE TRIGGER t_aft_del_row_possui_update_num
	AFTER DELETE
	ON possui
	FOR EACH ROW
	EXECUTE PROCEDURE conta_carros_delete();





-- REQUISITO 4
-- Faça um procedimento para cada tabela de seu esquema relacional para que permita a alteração de dados.
DROP PROCEDURE IF EXISTS altera_pessoa;
CREATE OR REPLACE PROCEDURE altera_pessoa
    (p_cod             INTEGER, 
     p_nome            VARCHAR(50), 
     p_sobrenome       VARCHAR(50), 
     p_data_nascimento date, 
     p_email           VARCHAR(64), 
     p_homepage        VARCHAR(64), 
     p_cep             VARCHAR(9), 
     p_numEndereco     INTEGER, 
     p_rua             VARCHAR(50))
LANGUAGE PLPGSQL
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pessoa WHERE codigo = p_cod)
    THEN
        RAISE EXCEPTION 'ERRO! Código não encontrado.';
    ELSE
        UPDATE pessoa
        SET pNome = p_nome,
            sobrenome = p_sobrenome,
            data_nascimento = p_data_nascimento,
            email = p_email,
            homepage = p_homepage,
            cep = p_cep,
            numEndereco = p_numEndereco,
            rua = p_rua
        WHERE codigo = p_cod;
    END IF;
END; $$;

DROP PROCEDURE IF EXISTS altera_carro;
CREATE OR REPLACE PROCEDURE altera_carro
    (c_placa   VARCHAR(8),   
     c_ano     INTEGER,   
     c_cor     VARCHAR(30),   
     c_modelo  VARCHAR(64))
LANGUAGE PLPGSQL
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM carro WHERE placa = c_placa)
    THEN
        RAISE EXCEPTION 'ERRO! Código não encontrado.';
    ELSE
        UPDATE carro
        SET ano = c_ano,
            cor = c_cor,
            modelo = c_modelo
        WHERE placa = c_placa;
    END IF;
END; $$;

DROP PROCEDURE IF EXISTS altera_telefone;
CREATE OR REPLACE PROCEDURE altera_telefone
    (t_codigo  INTEGER, 
     t_ddd     INTEGER, 
     t_prefixo INTEGER, 
     t_numero  INTEGER)
LANGUAGE PLPGSQL
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pessoa WHERE codigo = t_codigo)
    THEN
        RAISE EXCEPTION 'ERRO! Código não encontrado.';
    ELSEIF NOT EXISTS (SELECT 1 FROM telefone WHERE codigo = t_codigo) -- Pessoa existe mas nao possui telefone
    THEN
        INSERT INTO telefone 
        VALUES (t_codigo, t_ddd, t_prefixo, t_numero);
    ELSE
        UPDATE telefone
        SET ddd = t_ddd,
            prefixo = t_prefixo,
            numero = t_numero
        WHERE codigo = t_codigo;
    END IF;
END; $$;






-- REQUISITO 2
DROP FUNCTION IF EXISTS get_nome;
CREATE OR REPLACE FUNCTION get_nome (cod INTEGER) RETURNS TEXT
LANGUAGE PLPGSQL
AS $$
DECLARE
    s VARCHAR(101);
BEGIN
    SELECT CONCAT(pnome, ' ', sobrenome) INTO s
    FROM pessoa
    WHERE codigo = cod;
    RETURN s;
END; $$;

-- REQUISITO 3
-- Faça um procedimento para cada tabela de seu esquema relacional para que permita a inserção de dados.
DROP PROCEDURE IF EXISTS insere_pessoa;
CREATE OR REPLACE PROCEDURE insere_pessoa
    (p_cod             INTEGER, 
     p_nome            VARCHAR(50), 
     p_sobrenome       VARCHAR(50), 
     p_data_nascimento date, 
     p_email           VARCHAR(64), 
     p_homepage        VARCHAR(64), 
     p_cep             VARCHAR(9), 
     p_numEndereco     INTEGER, 
     p_rua             VARCHAR(50))
LANGUAGE PLPGSQL
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM pessoa WHERE codigo = p_cod)
    THEN
        RAISE EXCEPTION 'ERRO! Pessoa já inserida.';
    ELSE
        INSERT INTO pessoa
        VALUES (p_cod, p_nome, p_sobrenome, p_data_nascimento,
            p_email, p_homepage, p_cep, p_numEndereco, p_rua);
    END IF;
END; $$;

DROP PROCEDURE IF EXISTS insere_carro;
CREATE OR REPLACE PROCEDURE insere_carro
    (c_placa   VARCHAR(8),   
     c_ano     INTEGER,   
     c_cor     VARCHAR(30),   
     c_modelo  VARCHAR(64))
LANGUAGE PLPGSQL
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM carro WHERE placa = c_placa)
    THEN
        RAISE EXCEPTION 'ERRO! Carro já inserido.';
    ELSE
        INSERT INTO carro
        VALUES(c_placa, c_ano, c_cor, c_modelo);
    END IF;
END; $$;

DROP PROCEDURE IF EXISTS insere_telefone;
CREATE OR REPLACE PROCEDURE insere_telefone
    (t_codigo  INTEGER, 
     t_ddd     INTEGER, 
     t_prefixo INTEGER, 
     t_numero  INTEGER)
LANGUAGE PLPGSQL
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM telefone WHERE codigo = t_codigo)
    THEN
        RAISE EXCEPTION 'ERRO! Telefone já inserido.';
    ELSE
        INSERT INTO telefone 
        VALUES (t_codigo, t_ddd, t_prefixo, t_numero);
    END IF;
END; $$;

DROP PROCEDURE IF EXISTS insere_possui;
CREATE OR REPLACE PROCEDURE insere_possui
    (p_codigo  INTEGER, 
     c_placa   VARCHAR(10))
LANGUAGE PLPGSQL
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pessoa WHERE codigo = p_codigo)
    THEN
        RAISE EXCEPTION 'ERRO! Código não encontrado.';
    ELSEIF NOT EXISTS (SELECT 1 FROM carro WHERE placa = c_placa)
    THEN
        RAISE EXCEPTION 'ERRO! Placa não encontrada.';
    ELSE
        INSERT INTO possui
        VALUES(p_codigo, c_placa);
    END IF;
END; $$;
    