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

-- Remove os carros, se possivel, e posse de uma pessoa
CREATE OR REPLACE FUNCTION remove_dependencia_pessoa() RETURNS TRIGGER
LANGUAGE PLPGSQL 
AS $$
DECLARE 
	placaCarro VARCHAR(8);
BEGIN
    IF NOT EXISTS (SELECT 1 FROM temAmizade 
               WHERE codigo_pessoa = OLD.codigo OR
                     codigo_amiga = OLD.codigo)
    THEN             
        SELECT placa INTO placaCarro FROM possui WHERE codigo = OLD.codigo;

        DELETE FROM possui WHERE codigo = OLD.codigo;

        DELETE FROM carro
        WHERE placa = placaCarro AND
            NOT EXISTS (SELECT 1 FROM possui WHERE placa = placaCarro);
    ELSE
        RAISE EXCEPTION 'ERRO! Pessoa possui amizade!';
    END IF;
    RETURN OLD;
END;
$$;

DROP TRIGGER IF EXISTS t_bef_delete_row_pessoa
	ON pessoa;
CREATE TRIGGER t_bef_delete_row_pessoa
	BEFORE DELETE
	ON pessoa
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

-- REQUISITO 2: conta o numero de amigos e carros
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

DROP TRIGGER IF EXISTS t_aft_inst_row_possui
	ON possui;
CREATE TRIGGER t_aft_inst_row_possui
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
    RETURN OLD;
END; $$;

DROP TRIGGER IF EXISTS t_aft_del_row_possui
	ON possui;
CREATE TRIGGER t_aft_del_row_possui
	AFTER DELETE
	ON possui
	FOR EACH ROW
	EXECUTE PROCEDURE conta_carros_delete();

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

DROP TRIGGER IF EXISTS t_aft_inst_row_temAmizade
	ON temAmizade;
CREATE TRIGGER t_aft_inst_row_temAmizade
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
    RETURN OLD;
END; $$;

DROP TRIGGER IF EXISTS t_aft_del_row_temAmizade
	ON temAmizade;
CREATE TRIGGER t_aft_del_row_temAmizade
	AFTER DELETE
	ON temAmizade
	FOR EACH ROW
	EXECUTE PROCEDURE conta_amigos_delete();

