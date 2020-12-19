INSERT INTO pessoa (codigo, pnome, sobrenome, data_nascimento, email, cep, numEndereco, rua)
VALUES (111, 'Walter', 'White', '07-SEP-1959', 'walterwhite@gmail.com', '11111-111',  308, 'Rua Albuquerque')
;
INSERT INTO pessoa (codigo, pnome, sobrenome, data_nascimento, email, cep, numEndereco, rua)
VALUES (222, 'Jesse', 'Pinkman', '24-SEP-1984', 'pink@gmail.com', '22222-222', 102, 'Rua Novo Mexico') 
;
INSERT INTO pessoa 
VALUES (333, 'Gustavo', 'Fring', '03-JAN-1955', 'gusfring@gmail.com', 'lospolloshermanos.com', '33333-333', 1213, 'Rua Jefferson') 
;
INSERT INTO pessoa (codigo, pnome, sobrenome, data_nascimento, email, cep, numEndereco, rua)
VALUES (444, 'Skyler', 'White', '11-AUG-1970', 'sky@gmail.com', '11111-111', 308, 'Rua Albuquerque')
;
INSERT INTO carro 
VALUES ('1111111', 2001, 'Verde', 'Pontiac Aztek') 
;
INSERT INTO carro 
VALUES ('2222222', 1982, 'Vermelho', 'Chevrolet Monte Carlo')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('3333333', 1998, 'Volvo V70')
;
INSERT INTO possui 
VALUES (111, '1111111')
;
INSERT INTO possui 
VALUES (444, '1111111')
;
INSERT INTO possui 
VALUES (222, '2222222')  
;
INSERT INTO possui
VALUES (333, '3333333')
;
CALL insere_amizade(111, 222)
;
CALL insere_amizade(111, 333)
;
CALL insere_amizade(111, 444)
;
INSERT INTO pessoa 
VALUES (01, 'Francisca', 'Adriana Malu Corte Real', '26-OCT-1991', 'ffranciscaadrianamalucortereal@charquesorocaba.com.br', 'francisca_homepage', '17340-970', 157, 'Rua Passeio das Primaveras')
;
INSERT INTO pessoa 
VALUES (02, 'Raimundo', 'Manoel Murilo Nunes', '26-FEB-1998', 'rraimundomanoelmurilonunes@supercarioca.com', 'raimundo_homepage', '17340-970', 621, 'Rua Raimundo Correia')
;
INSERT INTO pessoa 
VALUES (03, 'Sergio', 'Bruno Arthur Castro', '09-OCT-1982', 'sergiobrunoarthurcastro@viacorte.com.br', 'sergiobruno_homepage', '17340-971', 616, 'Rua Ivan Fleury Meireles 126')
;
INSERT INTO pessoa 
VALUES (04, 'Leandro', 'Gabriel Lucas de Paula', '18-MAY-1991', 'lleandrogabriellucasdepaula@europamotors.com.br', 'leandrogabriel_homepage', '17340-970', 904, 'Rua Alfredo ')
;
INSERT INTO pessoa 
VALUES (05, 'Livia', 'Mirella Alice da Rocha', '04-MAR-1993', 'liviamirellaalicedarocha_@uol.com.bt', 'liviamirellaa_homepage', '17340-971', 788, 'Rua Ivan Fleury Meireles 126')
;
INSERT INTO pessoa 
VALUES (06, 'Laura', 'Marlene da Costa', '12-AUG-1987', 'lauramarlenedacosta-70@comercialrafael.com.br', 'lauramarlenedacosta_homepage', '17340-970', 393, 'Rua Winifrida 270')
;
INSERT INTO pessoa 
VALUES (07, 'Caroline', 'Luiza Brito', '14-MAR-1999', 'ccarolineluizabrito@flama.biz', 'carolineluizabrito_homepage', '17340-971', 623, 'Rua Ivan Fleury Meireles 126')
;
INSERT INTO pessoa 
VALUES (08, 'Aparecida', 'Heloisa Laura Almeida', '02-FEB-1997', 'aparecidaheloisalauraalmeida@bhcervejas.com.br', 'aparecidaheloisalauraalmeida_homepage', '17340-971', 912, 'Rua Ivan Fleury Meireles 126')
;
INSERT INTO pessoa 
VALUES (09, 'Martin', 'Otávio Marcos Vinicius Ferreira', '27-SEP-1981', 'mmartinotaviomarcosviniciusferreira@tce.sp.gov.br', 'martinotaviomarcosviniciusferreira_homepage', '17340-971', 413, 'Rua São Carlos')
;
INSERT INTO pessoa 
VALUES (10, 'Gael', 'Luiz Anderson Caldeira', '01-FEB-2000', 'gaelluizandersoncaldeira@radicigroup.com', 'gaelluizandersoncaldeira__homepage', '17340-970', 577, 'Rua Frida 271')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('GVZ9079', 1999, 'Xsara Exclusive 2.0 16V')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('MRR2514', 2000, 'Jumper 2.8 Furg')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('EXM7423', 2003, 'Palio 1.0')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('JLZ6723', 2009, 'LINEA T-JET 1.4 ')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('MYP3278', 1998, 'Bravo SX 1.6')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('AQA9051', 2005, 'Astra Sed.Comf. 2.0 MPFI FlexPower 8V 4p')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('MRN1970', 2008, 'Vectra GT 2.0 MPFI 8V FlexPower Aut.')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('JTM7705', 2004, 'MONTANA  Sport 1.8 MPFI FlexPower 8V')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('MRE3414', 2012, 'Hilux Chassi D4-D 4x4 3.0 TDI Dies. Mec.')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('MEB2511', 2017, 'ETIOS X 1.3 Flex 16V 5p Aut.')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('MMS1744', 2006, 'PANTANAL 3.0 TDI Elet. 4x4 CS Diesel')
;
INSERT INTO carro (placa, ano, modelo)
VALUES ('NAU9527', 2014, 'up! move 1.0 Total Flex 12V 5p')
;
INSERT INTO possui 
VALUES (01, 'GVZ9079')
;
INSERT INTO possui 
VALUES (02, 'MRR2514')
;
INSERT INTO possui 
VALUES (03, 'EXM7423')
;
INSERT INTO possui 
VALUES (04, 'JLZ6723')
;
INSERT INTO possui 
VALUES (05, 'MYP3278')
;
INSERT INTO possui 
VALUES (06, 'AQA9051')
;
INSERT INTO possui 
VALUES (07, 'MRN1970')
;
INSERT INTO possui 
VALUES (08, 'JTM7705')
;
INSERT INTO possui 
VALUES (09, 'MRE3414')
;
INSERT INTO possui 
VALUES (09, 'MMS1744')
;
CALL insere_amizade(01, 02)
;
CALL insere_amizade(01, 03)
;
CALL insere_amizade(01, 04)
;
CALL insere_amizade(01, 05)
;
CALL insere_amizade(01, 07)
;
CALL insere_amizade(01, 08)
;
CALL insere_amizade(02, 05)
;
CALL insere_amizade(02, 09)
;
CALL insere_amizade(03, 05)
;
CALL insere_amizade(03, 07)
;
CALL insere_amizade(04, 05)
;
CALL insere_amizade(06, 07)
;