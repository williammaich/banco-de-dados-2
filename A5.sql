/* CRIAÃ‡ÃƒO DE SCHEMA / DEFINIÃ‡ÃƒO*/
  DROP SCHEMA IF EXISTS aula05;
  CREATE SCHEMA aula05;
  USE aula05;

-- PAIS
CREATE  TABLE pais (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id) 
);

-- CIDADE
CREATE TABLE cidade (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  uf CHAR(2) NULL,
  PRIMARY KEY (id)
);

-- CINEMA
CREATE TABLE cinema (
  id INT NOT NULL AUTO_INCREMENT,
  nomeFantasia VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  bairro VARCHAR(45) NOT NULL,
  idCidade INT NOT NULL,
  capacidade INT NOT NULL,
  PRIMARY KEY (id) 
);

-- GENERO
CREATE  TABLE genero (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id) 
);

-- ATOR
CREATE  TABLE ator (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));

-- FILME
CREATE  TABLE filme (
  id INT NOT NULL AUTO_INCREMENT,
  idGenero INT NOT NULL,
  idPais INT NOT NULL,
  idDiretor INT NOT NULL,
  tituloOriginal VARCHAR(45) NOT NULL,
  tituloPortugues VARCHAR(45) NULL,
  duracao INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_filme_genero
    FOREIGN KEY (idGenero) REFERENCES genero (id),
  CONSTRAINT fk_filme_pais
    FOREIGN KEY (idPais) REFERENCES pais (id),
  CONSTRAINT fk_filme_ator
    FOREIGN KEY (idDiretor) REFERENCES ator (id));

-- ELENCO
CREATE  TABLE elenco (
  idFilme INT NOT NULL,
  idAtor INT NOT NULL,
  PRIMARY KEY (idFilme, idAtor),
  CONSTRAINT fk_elenco_filme
    FOREIGN KEY (idFilme) REFERENCES filme (id),
  CONSTRAINT fk_elenco_ator
    FOREIGN KEY (idAtor) REFERENCES ator (id));

-- SESSAO
CREATE  TABLE sessao (
  id INT NOT NULL AUTO_INCREMENT,
  idCinema INT NOT NULL,
  idFilme INT NOT NULL,
  data DATE NOT NULL,
  horaInicio TIME NOT NULL,
  publico INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_sessao_cinema
    FOREIGN KEY (idCinema) REFERENCES cinema (id),
  CONSTRAINT fk_sessao_filme
    FOREIGN KEY (idFilme)  REFERENCES filme (id));

-- USUARIO
CREATE TABLE usuario (
  id INT NOT NULL AUTO_INCREMENT,
  idCidade INT NOT NULL,
  nome VARCHAR(45) NULL,
  email VARCHAR(100) NULL,
  PRIMARY KEY (id),
    CONSTRAINT fk_usuario_cidade
    FOREIGN KEY (idCidade) REFERENCES cidade (id));

-- TIPO PAGAMENTO
CREATE table tipoPagto (
  id INT NOT NULL AUTO_INCREMENT, 
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));

-- VENDA
CREATE TABLE venda (
  id INT NOT NULL AUTO_INCREMENT,
  idSessao INT NOT NULL,
  idTipoPagto INT NOT NULL,
  idUsuario INT NOT NULL,
  data DATE NULL,
  hora TIME NULL,
  valorIngresso DOUBLE NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_venda_sessao
    FOREIGN KEY (idSessao)    REFERENCES sessao (id),
  CONSTRAINT fk_venda_usuario
    FOREIGN KEY (idUsuario)   REFERENCES usuario (id),
  CONSTRAINT fk_venda_tipoPagto 
    FOREIGN KEY (idTipoPagto) REFERENCES tipoPagto (id));

-- PARCELA
CREATE table parcela (
  id INT NOT NULL AUTO_INCREMENT, 
  idVenda INT NOT NULL, 
  valor DOUBLE, 
  vencimento DATE, 
  situacao VARCHAR(45), 
PRIMARY KEY (id, idVenda),
CONSTRAINT fk_venda_parcela
    FOREIGN KEY (idVenda) REFERENCES venda (id)); 
 


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


--3) Crie uma consulta para listar o somatório de ingressos vendidos para cada filme
--onde o tipo de pagamento foi parcelado. Liste o nome do filme e o somatório de valor de ingressos

SELECT filme.tituloPortugues AS "FILME", SUM(venda.valorIngresso) AS "SOMA"
FROM filme
INNER JOIN sessao ON filme.id = sessao.id
INNER JOIN venda ON filme.id = venda.id
INNER JOIN tipoPagto ON venda.id = tipoPagto.id
WHERE tipoPagto.nome = "Parcelado"
GROUP BY filme.tituloPortugues;


--4)Altere a consulta anterior para que, utilizando a propriedade 
--HAVING, a consulta que liste somente os filmes com mais 
--de 3 ingressosvendidos (cadastre mais vendas se necessário);

SELECT filme.tituloPortugues AS "filme", COUNT(venda.id) AS "venda"
FROM filme
INNER JOIN sessao ON filme.id = sessao.id
INNER JOIN venda ON filme.id = venda.id
GROUP BY filme.tituloPortugues
HAVING COUNT(venda.id) >= 3;

