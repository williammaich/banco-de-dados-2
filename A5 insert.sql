USE aula05;

-- Ator
INSERT INTO ator 
(nome) 
VALUES
('Michael Douglas'),
('Angelina Jolie'),
('Tom Cruise'),
('Leonardo Dicaprio'),
('Adam Sandler'),
('Ben Stiller'),
('Will Smith'),
('Jannifer Aniston'),
('Meryl Streep'),
('Charlize Theron'),
('Kristen Stewart'),
('Denzel Washington'),
('Keira Knightley'),
('Jude Law'),
('John Hawkes'),
('Helen Hunt'),
('Jamie Foxx'),
('Joaquim Phoenix'),
('Matthew McConaughey'),
('Jessica Chastain'),
('Jason Clarke'),
('Jean-Louis Trintignant'),
('Emmanuelle Riva'),
('Kristen Connolly'),
('Chris Hemsworth'),
('Dom Cheadle'),
	
-- Diretor
('Martin Scorsese'),
('Quentin Tarantino'),
('Roman Polanski'),
('Steven Spilberg'),
('Robert Zemeckis'),
('Joe Wright'),
('Ben Lewin'),
('Paul Thomas Anderson'),
('William Friedkin'),
('Kathryn Bigelow'),
('Michael Haneke'),
('Drew Goddard');
	
-- PaÃ­s
INSERT INTO pais 
(nome) 
VALUES 
('Brasil'),
('Estados Unidos'),
('Inglaterra'),
('FranÃ§a');

-- cidade
INSERT INTO cidade 
(nome, uf) 
VALUES 
('Pelotas', 'RS'),
('Arroio Grande', 'RS'),
('Campinas', 'SP'),
('Herval', 'RS'),
('JaguarÃ£o', 'RS');

-- GÃªnero
INSERT INTO genero 
(nome) 
VALUES 
('ComÃ©dia'),
('FicÃ§Ã£o'),
('Drama'),
('AÃ§Ã£o/Aventura'),
('Suspense'),
('Terror'),
('Policial'),
('Faroeste');

-- Filme
INSERT INTO filme 
(tituloOriginal, tituloPortugues, duracao, idDiretor, idGenero, idPais) 
VALUES 
('Flight','O Voo',138,5,3,2),
('Anna Karenina','Anna Karenina',131,6,3,3),
('The Sessions','As SessÃµes',98,7,1,2),
('Django Unchained','Django Livre',164,2,8,2),
('The Master','O Mestre',144,8,3,2),
('Killer Joe','Killer Joe - Matador de Aluguel',102,9,5,2),
('Zero Dark Thirty','A Hora Mais Escura',157,10,5,2),
('Amour','Amor',127,11,3,4),
('The Cabin in The Woods','O Segredo da Cabana',105,12,6,2);

-- Elenco
INSERT INTO elenco 
(idFilme, idAtor) 
VALUES 
(1,12),
(1,26),
(2,13),
(2,14),
(3,15),
(3,16),
(4,4),
(4,17),
(5,18),
(6,19),
(7,20),
(7,21),
(8,22),
(8,23),
(9,24),
(9,25);

-- cinema
INSERT INTO cinema 
(nomeFantasia, endereco, bairro, idCidade, capacidade) 
VALUES 
('Cine Art Pelotas - Sala1', 'Rua Andrade Neves, 1510','Centro',1, 400),
('Cine Art Pelotas - Sala2', 'Rua Andrade Neves, 1510','Centro',1, 300),
('Cine Art Pelotas - Sala3', 'Rua Andrade Neves, 1510','Centro',1, 250),
('Cineart', 'Avenida EdmÃ©ia Matos Lazzarotti, 1655','Centro',2, 400),
('Cine Art RG - Sala1', 'Av Oswaldo Barros, 251','Centro',3, 400),
('Cine Art POA - Sala1', 'Av das NaÃ§Ãµes, 665','Centro',4, 700),
('Cine Art POA - Sala2', 'Av das NaÃ§Ãµes, 665','Centro',4, 500);

-- sessao
INSERT INTO sessao 
(idCinema, idFilme, data, horaInicio, publico) 
VALUES 
(1,2,'2017-03-01','16:00:00',45),
(1,2,'2017-03-01','19:00:00',80),
(1,9,'2017-03-01','21:30:00',95),
(2,1,'2017-03-01','16:00:00',38),
(2,1,'2017-03-01','19:00:00',55),
(2,8,'2017-03-01','21:30:00',110),
(3,6,'2017-03-01','16:00:00',60),
(3,6,'2017-03-01','19:00:00',75),
(4,7,'2017-03-01','18:00:00',185),
(5,1,'2017-03-01','16:00:00',145),
(5,1,'2017-03-01','20:00:00',249),
(6,6,'2017-03-01','15:00:00',314),
(6,2,'2017-03-01','19:40:00',489),
(6,9,'2017-03-01','21:45:00',548),
(1,2,'2017-03-02','16:00:00',64),
(1,2,'2017-03-02','19:00:00',98),
(1,9,'2017-03-02','21:30:00',114),
(2,1,'2017-03-02','16:00:00',57),
(2,1,'2017-03-02','19:00:00',78),
(2,8,'2017-03-02','21:30:00',134),
(3,6,'2017-03-02','16:00:00',48),
(3,6,'2017-03-02','19:00:00',75),
(4,7,'2017-03-02','18:00:00',158),
(5,1,'2017-03-02','16:00:00',105),
(5,1,'2017-03-02','20:00:00',214),
(6,6,'2017-03-02','15:00:00',289),
(6,2,'2017-03-02','19:40:00',425),
(6,9,'2017-03-02','21:45:00',502),
(1,2,'2017-03-03','16:00:00',95),
(1,2,'2017-03-03','19:00:00',124),
(1,9,'2017-03-03','21:30:00',158),
(2,1,'2017-03-03','16:00:00',46),
(2,1,'2017-03-03','19:00:00',97),
(2,8,'2017-03-03','21:30:00',187),
(3,6,'2017-03-03','16:00:00',87),
(3,6,'2017-03-03','19:00:00',105),
(4,7,'2017-03-03','18:00:00',198),
(5,1,'2017-03-03','16:00:00',97),
(5,1,'2017-03-03','20:00:00',248),
(6,6,'2017-03-03','15:00:00',314),
(6,2,'2017-03-03','19:40:00',499),
(6,9,'2017-03-03','21:45:00',587),
(1,2,'2017-03-04','16:00:00',55),
(1,2,'2017-03-04','19:00:00',108),
(1,9,'2017-03-04','21:30:00',187),
(2,1,'2017-03-04','16:00:00',67),
(2,1,'2017-03-04','19:00:00',89),
(2,8,'2017-03-04','21:30:00',144),
(3,6,'2017-03-04','16:00:00',75),
(3,6,'2017-03-04','19:00:00',101),
(4,7,'2017-03-04','18:00:00',149),
(5,1,'2017-03-04','16:00:00',115),
(5,1,'2017-03-04','20:00:00',268),
(6,6,'2017-03-04','15:00:00',387),
(6,2,'2017-03-04','19:40:00',455),
(6,9,'2017-03-04','21:45:00',608);

-- usuario
INSERT INTO usuario 

(idCidade, nome, email) 
VALUES 
	(3, 'EdÃ©cio', 'essecaraehbom@professor.com'),
	(3, 'Luzzardi', 'reidochurras@professor.com.uy'),
	(2, 'Angeloni', 'angel@hotwheels.com'),
	(1, 'Carlucho', 'alemao@batata.com'),
	(5, 'CoelhoDaPascoa', 'ovodechocolate@euacredito.com.br'),
	(4, 'Gladimir', 'ouniconormal@hotwheels.com');

INSERT INTO tipoPagto 
(nome)
VALUES
	('A Vista'), 
	('Parcelado');

-- venda
INSERT INTO venda 
(idSessao, idUsuario, data, hora, valorIngresso, idTipoPagto) 
VALUES 
	(2, 1, '2017-03-01','16:00:00',15.00, 1),
	(4, 2, '2017-03-01','16:00:00',10.00, 2),
	(13,3,'2017-03-01','16:00:00',12.00, 2),
	(14,4,'2017-03-01','20:00:00',12.00, 2),
	(17,5,'2017-03-01','21:45:00',18.00, 1),
	(19,6,'2017-03-01','18:50:00',18.00, 1),
	(22,1,'2017-03-02','19:00:00',15.00, 1),
	(23,2,'2017-03-02','21:30:00',15.00, 1),
	(14,3,'2017-03-01','20:00:00',12.00, 1),
	(20,6,'2017-03-01','21:40:00',18.00, 1),
	(15,5,'2017-03-01','15:00:00',18.00, 1);

-- INSERIR NA PARCELA
INSERT INTO parcela 
(idVenda, valor, vencimento, situacao)
VALUES
(2, 5.00, '2017-03-01', 'ABERTO'),
(2, 5.00, '2017-03-02', 'ABERTO'),
(2, 5.00, '2017-03-03', 'ABERTO'),
(3, 5.00, '2017-03-01', 'ABERTO'),
(3, 5.00, '2017-03-02', 'ABERTO'),
(4, 12.00, '2017-03-03', 'ABERTO');
