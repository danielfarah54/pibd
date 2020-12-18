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

DROP TRIGGER IF EXISTS t_aft_delete_row_pessoa
	ON pessoa;
CREATE TRIGGER t_aft_delete_row_pessoa
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
