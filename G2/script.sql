-- Restrição 3 no atributo 'cor'
create table carro (   
    placa   varchar2(8),   
    ano     number not null,   
    cor     varchar2(30) DEFAULT 'Branco',   
    modelo  varchar2(50),   
    constraint pk_carro primary key (placa)
);
/
create table pessoa ( 
    codigo          number, 
    primeiroNome    varchar2(40) not null, 
    sobrenome       varchar2(40) not null, 
    dataNascimento  date not null, 
    email           varchar2(64) not null, 
    homepage        varchar2(64), 
    cep             varchar2(9), 
    numEndereco     number, 
    rua             varchar2(50), 
    constraint pk_pessoa primary key (codigo)
);
/
create table possui ( 
    codigo  number, 
    placa   varchar2(10), 
    constraint pk_possui primary key (codigo, placa), 
    constraint fk_possui_codigo foreign key (codigo) 
        references pessoa (codigo),
    constraint fk_possui_placa foreign key (placa) 
        references carro (placa)
);
/
create table telefone ( 
    codigo  number, 
    ddd     number(2,0), 
    prefixo number(1,0), 
    numero  number(8,0), 
    constraint pk_telefone primary key (codigo), 
    constraint fk_telefon_codigo foreign key (codigo)  
        references pessoa (codigo) 
        on delete cascade
);
/
-- Restrição 3 no atributo 'data'
create table temAmizade ( 
    codigoPessoa    number, 
    codigoAmiga     number, 
    data            date default SYSDATE,
    constraint pk_temAmizade primary key (codigoPessoa, codigoAmiga), 
    constraint fk_temAmizade_codigoPessoa foreign key (codigoPessoa) 
        references pessoa (codigo), 
    constraint fk_temAmizade_codigoAmiga foreign key (codigoAmiga) 
        references pessoa (codigo) 
);
/
create or replace procedure InsereAmizade
    (codigoPessoa in number, 
     codigoAmiga in number, 
     data in date default sysdate)
is
begin
    insert into temAmizade
    values (codigoPessoa, codigoAmiga, data);
    
    insert into temAmizade
    values (codigoAmiga, codigoPessoa, data);
end;
/
-- Popula as tabelas
insert into pessoa (codigo, primeiroNome, sobrenome, dataNascimento, email, cep, numEndereco, rua)
values (111, 'Walter', 'White', '07-SEP-1959', 'walterwhite@gmail.com', '11111-111',  308, 'Rua Albuquerque')
/
insert into pessoa (codigo, primeiroNome, sobrenome, dataNascimento, email, cep, numEndereco, rua)
values (222, 'Jesse', 'Pinkman', '24-SEP-1984', 'pink@gmail.com', '22222-222', 102, 'Rua Novo Mexico') 
/
insert into pessoa 
values (333, 'Gustavo', 'Fring', '03-JAN-1955', 'gusfring@gmail.com', 'lospolloshermanos.com', '33333-333', 1213, 'Rua Jefferson') 
/
insert into pessoa (codigo, primeiroNome, sobrenome, dataNascimento, email, cep, numEndereco, rua)
values (444, 'Skyler', 'White', '11-AUG-1970', 'sky@gmail.com', '11111-111', 308, 'Rua Albuquerque')
/
insert into carro 
values ('1111111', 2001, 'Verde', 'Pontiac Aztek') 
/
insert into carro 
values ('2222222', 1982, 'Vermelho', 'Chevrolet Monte Carlo')
/
insert into carro (placa, ano, modelo)
values ('3333333', 1998, 'Volvo V70')
/
insert into possui 
values (111, '1111111')
/
insert into possui 
values (444, '1111111')
/
insert into possui 
values (222, '2222222')  
/
insert into possui
values (333, '3333333')
/
exec InsereAmizade(111, 222)
/
exec InsereAmizade(111, 333)
/
exec InsereAmizade(111, 444)
/
insert into pessoa 
values (01, 'Francisca', 'Adriana Malu Corte Real', '26-OCT-1991', 'ffranciscaadrianamalucortereal@charquesorocaba.com.br', 'francisca_homepage', '17340-970', 157, 'Rua Passeio das Primaveras')
/
insert into pessoa 
values (02, 'Raimundo', 'Manoel Murilo Nunes', '26-FEB-1998', 'rraimundomanoelmurilonunes@supercarioca.com', 'raimundo_homepage', '17340-970', 621, 'Rua Raimundo Correia')
/
insert into pessoa 
values (03, 'Sergio', 'Bruno Arthur Castro', '09-OCT-1982', 'sergiobrunoarthurcastro@viacorte.com.br', 'sergiobruno_homepage', '17340-971', 616, 'Rua Ivan Fleury Meireles 126')
/
insert into pessoa 
values (04, 'Leandro', 'Gabriel Lucas de Paula', '18-MAY-1991', 'lleandrogabriellucasdepaula@europamotors.com.br', 'leandrogabriel_homepage', '17340-970', 904, 'Rua Alfredo ')
/
insert into pessoa 
values (05, 'Livia', 'Mirella Alice da Rocha', '04-MAR-1993', 'liviamirellaalicedarocha_@uol.com.bt', 'liviamirellaa_homepage', '17340-971', 788, 'Rua Ivan Fleury Meireles 126')
/
insert into pessoa 
values (06, 'Laura', 'Marlene da Costa', '12-AUG-1987', 'lauramarlenedacosta-70@comercialrafael.com.br', 'lauramarlenedacosta_homepage', '17340-970', 393, 'Rua Winifrida 270')
/
insert into pessoa 
values (07, 'Caroline', 'Luiza Brito', '14-MAR-1999', 'ccarolineluizabrito@flama.biz', 'carolineluizabrito_homepage', '17340-971', 623, 'Rua Ivan Fleury Meireles 126')
/
insert into pessoa 
values (08, 'Aparecida', 'Heloisa Laura Almeida', '02-FEB-1997', 'aparecidaheloisalauraalmeida@bhcervejas.com.br', 'aparecidaheloisalauraalmeida_homepage', '17340-971', 912, 'Rua Ivan Fleury Meireles 126')
/
insert into pessoa 
values (09, 'Martin', 'Otávio Marcos Vinicius Ferreira', '27-SEP-1981', 'mmartinotaviomarcosviniciusferreira@tce.sp.gov.br', 'martinotaviomarcosviniciusferreira_homepage', '17340-971', 413, 'Rua São Carlos')
/
insert into pessoa 
values (10, 'Gael', 'Luiz Anderson Caldeira', '01-FEB-2000', 'gaelluizandersoncaldeira@radicigroup.com', 'gaelluizandersoncaldeira__homepage', '17340-970', 577, 'Rua Frida 271')
/
insert into carro (placa, ano, modelo)
values ('GVZ9079', 1999, 'Xsara Exclusive 2.0 16V')
/
insert into carro (placa, ano, modelo)
values ('MRR2514', 2000, 'Jumper 2.8 Furg')
/
insert into carro (placa, ano, modelo)
values ('EXM7423', 2003, 'Palio 1.0')
/
insert into carro (placa, ano, modelo)
values ('JLZ6723', 2009, 'LINEA T-JET 1.4 ')
/
insert into carro (placa, ano, modelo)
values ('MYP3278', 1998, 'Bravo SX 1.6')
/
insert into carro (placa, ano, modelo)
values ('AQA9051', 2005, 'Astra Sed.Comf. 2.0 MPFI FlexPower 8V 4p')
/
insert into carro (placa, ano, modelo)
values ('MRN1970', 2008, 'Vectra GT 2.0 MPFI 8V FlexPower Aut.')
/
insert into carro (placa, ano, modelo)
values ('JTM7705', 2004, 'MONTANA  Sport 1.8 MPFI FlexPower 8V')
/
insert into carro (placa, ano, modelo)
values ('MRE3414', 2012, 'Hilux Chassi D4-D 4x4 3.0 TDI Dies. Mec.')
/
insert into carro (placa, ano, modelo)
values ('MEB2511', 2017, 'ETIOS X 1.3 Flex 16V 5p Aut.')
/
insert into carro (placa, ano, modelo)
values ('MMS1744', 2006, 'PANTANAL 3.0 TDI Elet. 4x4 CS Diesel')
/
insert into carro (placa, ano, modelo)
values ('NAU9527', 2014, 'up! move 1.0 Total Flex 12V 5p')
/
insert into possui 
values (01, 'GVZ9079')
/
insert into possui 
values (02, 'MRR2514')
/
insert into possui 
values (03, 'EXM7423')
/
insert into possui 
values (04, 'JLZ6723')
/
insert into possui 
values (05, 'MYP3278')
/
insert into possui 
values (06, 'AQA9051')
/
insert into possui 
values (07, 'MRN1970')
/
insert into possui 
values (08, 'JTM7705')
/
insert into possui 
values (09, 'MRE3414')
/
insert into possui 
values (09, 'MMS1744')
/
insert into possui 
values (10, 'NAU9527')
/
insert into possui 
values (10, 'MEB2511')
/
exec InsereAmizade(01, 02)
/
exec InsereAmizade(01, 03)
/
exec InsereAmizade(01, 04)
/
exec InsereAmizade(01, 05)
/
exec InsereAmizade(01, 07)
/
exec InsereAmizade(01, 08)
/
exec InsereAmizade(01, 10)
/
exec InsereAmizade(02, 05)
/
exec InsereAmizade(02, 09)
/
exec InsereAmizade(03, 05)
/
exec InsereAmizade(03, 07)
/
exec InsereAmizade(04, 05)
/
exec InsereAmizade(04, 10)
/
exec InsereAmizade(06, 07)
/
exec InsereAmizade(06, 09)
/
exec InsereAmizade(06, 10)
/
exec InsereAmizade(08, 09)
/
exec InsereAmizade(08, 10)
/

-- Restrição 1 - Remove carros e posse de uma pessoa
create or replace trigger t_aft_delete_row_codigo
    before delete 
    on pessoa 
for each row 
declare
    placaCarro varchar2(8);
begin 
    select placa into placaCarro from possui where codigo = :old.codigo;
    
    delete from possui where codigo = :old.codigo;
    
    delete from carro 
    where placa = placaCarro AND
          not exists (select 1 from possui where placa = placaCarro);
end;
/
-- Restrição 2 - Impede a remoção de pessoa com amizade
create or replace trigger t_bef_delete_row_codigo
    before delete
    on pessoa
for each row
declare
    n number;
begin
    select count(*) into n 
    from temAmizade
    where codigoPessoa = :old.codigo or
          codigoAmiga = :old.codigo;
          
    if n > 0
        then
            raise_application_error(-20500, 'Pessoa possui amizade, impossivel remove!');
    end if;
end;
/