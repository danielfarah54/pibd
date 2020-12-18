DROP TABLE IF EXISTS telefone;
DROP TABLE IF EXISTS temAmizade;
DROP TABLE IF EXISTS possui;
DROP TABLE IF EXISTS carro;
DROP TABLE IF EXISTS pessoa;

-- Restrição 3 no atributo 'cor'
CREATE TABLE carro (   
    placa   VARCHAR(8),   
    ano     INTEGER NOT NULL,   
    cor     VARCHAR(30) DEFAULT 'Branco',   
    modelo  VARCHAR(64),   
    CONSTRAINT pk_carro PRIMARY KEY (placa)
);

CREATE TABLE pessoa ( 
    codigo          INTEGER, 
    pNome    VARCHAR(50) NOT NULL, 
    sobrenome       VARCHAR(50) NOT NULL, 
    data_nascimento  date not null, 
    email           VARCHAR(64) not null, 
    homepage        VARCHAR(64), 
    cep             VARCHAR(9), 
    numEndereco     INTEGER, 
    rua             VARCHAR(50), 
    CONSTRAINT pk_pessoa PRIMARY KEY (codigo)
);
-- ON DELETE CASCADE CODIGO
CREATE TABLE possui ( 
    codigo  INTEGER, 
    placa   VARCHAR(10), 
    CONSTRAINT pk_possui PRIMARY KEY (codigo, placa), 
    CONSTRAINT fk_possui_codigo FOREIGN KEY (codigo) 
        REFERENCES pessoa (codigo), 
    CONSTRAINT fk_possui_placa FOREIGN KEY (placa) 
        REFERENCES carro (placa)
);

CREATE TABLE telefone ( 
    codigo  INTEGER, 
    ddd     INTEGER, 
    prefixo INTEGER, 
    numero  INTEGER, 
    CONSTRAINT pk_telefone PRIMARY KEY (codigo), 
    CONSTRAINT fk_telefon_codigo FOREIGN KEY (codigo)  
        REFERENCES pessoa (codigo) 
        ON DELETE CASCADE
);

-- Restrição 3 no atributo 'data'
CREATE TABLE temAmizade ( 
    codigo_pessoa    INTEGER, 
    codigo_amiga     INTEGER, 
    data_amizade     DATE DEFAULT CURRENT_DATE,
    CONSTRAINT pk_tem_amizade PRIMARY KEY (codigo_pessoa, codigo_amiga), 
    CONSTRAINT fk_tem_amizade_codigo_pessoa FOREIGN KEY (codigo_pessoa) 
        REFERENCES pessoa (codigo), 
    CONSTRAINT fk_tem_amizade_codigo_amiga FOREIGN KEY (codigo_amiga) 
        REFERENCES pessoa (codigo) 
);
