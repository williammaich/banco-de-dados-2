* CRIAÃ‡ÃƒO DE SCHEMA / DEFINIÃ‡ÃƒO*/
  DROP SCHEMA IF EXISTS aula04_virus;
  CREATE SCHEMA aula04_virus;
  USE aula04_virus;

-- -----------------------------------------------------
-- Tabela virus
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS virus (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT,
  PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Tabela autor
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS autor (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Tabela jornal
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jornal (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  volume INT NOT NULL,
  edicao INT NOT NULL, 
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Tabela instituicao
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS instituicao (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (id) 
);

-- -----------------------------------------------------
-- Tabela contrato
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS contrato (
  id INT NOT NULL AUTO_INCREMENT,
  numero INT NOT NULL,
  dataInicio DATE NOT NULL,
  dataTermino DATE NOT NULL,
  valor DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Tabela publicacao
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS publicacao (
  id INT NOT NULL AUTO_INCREMENT,
  idContrato INT NOT NULL,
  idJornal INT NOT NULL,
  data DATE NULL,
  assunto VARCHAR(45) NULL,
  texto TEXT NULL,
  abstract TEXT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_JORNAL_PUBLICACAO
    FOREIGN KEY (idJornal) REFERENCES jornal (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_CONTRATO_PUBLICACAO
    FOREIGN KEY (idContrato) REFERENCES contrato (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Tabela publicacaoAutor
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS publicacaoAutor (
  idPublicacao INT NOT NULL,
  idAutor INT NOT NULL,
  PRIMARY KEY (idPublicacao, idAutor),
  CONSTRAINT FK_PUBLICACAO_PUBLICACAO
    FOREIGN KEY (idPublicacao) REFERENCES publicacao (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_AUTOR_PUBLICACAO
    FOREIGN KEY (idAutor) REFERENCES autor (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Tabela publicacaoVirus
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS publicacaoVirus (
  idPublicacao INT NOT NULL,
  idvirus INT NOT NULL,
  PRIMARY KEY (idPublicacao, idvirus),
  CONSTRAINT FK_PUBLICACAO_PUBLICACAOVIRUS
    FOREIGN KEY (idPublicacao) REFERENCES publicacao (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_virus_PUBLICACAOvirus
    FOREIGN KEY (idvirus) REFERENCES virus (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Tabela publicacaoInstituicao
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS publicacaoInstituicao (
  idPublicacao INT NOT NULL,
  idInstituicao INT NOT NULL,
  PRIMARY KEY (idPublicacao, idInstituicao),
  CONSTRAINT FK_PUBLICACAOINSTITUICAO_PUBLICACAO
    FOREIGN KEY (idPublicacao) REFERENCES publicacao (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_PUBLICACAOINSTITUICAO_INSTITUICAO
    FOREIGN KEY (idInstituicao) REFERENCES instituicao (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Tabela referencias
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS referencias (
  id INT NOT NULL AUTO_INCREMENT,
  idPublicacaoOrigem INT NOT NULL,
  idPublicacaoReferencia INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_REFERENCIA_ORIGEM
    FOREIGN KEY (idPublicacaoOrigem) REFERENCES publicacao (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_REFERENCIA_REFERENCIA
    FOREIGN KEY (idPublicacaoReferencia) REFERENCES publicacao (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- INSERTs para a tabela instituicao
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO instituicao (id, nome) VALUES (NULL, 'SENAC');
INSERT INTO instituicao (id, nome) VALUES (NULL, 'FURG');
INSERT INTO instituicao (id, nome) VALUES (NULL, 'UFPel');
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela jornal
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 1, 'Jornal A Trombeta', 1, 2);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 2, 'Jornal A Trombeta', 1, 3);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 3, 'Jornal Megafone', 2, 1);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 4, 'Jornal Megafone', 2, 2);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 5, 'Jornal CuraPel Informa', 1, 1);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 6, 'Jornal CuraPel Informa', 2, 1);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 7, 'Jornal CuraPel Informa', 3, 1);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 8, 'Jornal CuraPel Informa', 4, 1);
INSERT INTO jornal (id, nome, volume, edicao) VALUES ( 9, 'Jornal CuraPel Informa', 5, 1);
INSERT INTO jornal (id, nome, volume, edicao) VALUES (10, 'Jornal CuraPel Informa', 6, 1);
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela contrato
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO contrato (id, numero, dataInicio, dataTermino, valor) VALUES (1, 515, '2017-01-30', '2017-03-30', 10010.10);
INSERT INTO contrato (id, numero, dataInicio, dataTermino, valor) VALUES (2, 513, '2017-02-28', '2017-04-29', 15215.50);
INSERT INTO contrato (id, numero, dataInicio, dataTermino, valor) VALUES (3, 212, '2017-03-20', '2017-07-30', 50513.18);
INSERT INTO contrato (id, numero, dataInicio, dataTermino, valor) VALUES (4, 210, '2017-09-20', '2017-12-20', 200128.10);
INSERT INTO contrato (id, numero, dataInicio, dataTermino, valor) VALUES (5, 201, '2017-01-01', '2017-12-30', 895548.15);
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela autor
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO autor (id, nome) VALUES ( 1, 'Dr. Alessandro');
INSERT INTO autor (id, nome) VALUES ( 2, 'Dr. Carlos');
INSERT INTO autor (id, nome) VALUES ( 3, 'Dra. Dayane');
INSERT INTO autor (id, nome) VALUES ( 4, 'Dr. Renato');
INSERT INTO autor (id, nome) VALUES ( 5, 'Dr. Vinicius');
INSERT INTO autor (id, nome) VALUES ( 6, 'Dr. William');
INSERT INTO autor (id, nome) VALUES ( 7, 'Dr. Alexandre');
INSERT INTO autor (id, nome) VALUES ( 8, 'Dr. Fernando');
INSERT INTO autor (id, nome) VALUES ( 9, 'Dra. Bruna');
INSERT INTO autor (id, nome) VALUES (10, 'Dr. Derick');
INSERT INTO autor (id, nome) VALUES (11, 'Dr. Dionatan');
INSERT INTO autor (id, nome) VALUES (12, 'Dr. Filipe');
INSERT INTO autor (id, nome) VALUES (13, 'Dr. Matheus');
INSERT INTO autor (id, nome) VALUES (14, 'Dr. Rafael');
INSERT INTO autor (id, nome) VALUES (15, 'Dr. Jones');
INSERT INTO autor (id, nome) VALUES (16, 'Dr. Thiago');
INSERT INTO autor (id, nome) VALUES (17, 'Dr. Kelvin');
INSERT INTO autor (id, nome) VALUES (18, 'Dr. Elvis');
INSERT INTO autor (id, nome) VALUES (19, 'Dr. Lucas');
INSERT INTO autor (id, nome) VALUES (20, 'Dr. Lussandro');
INSERT INTO autor (id, nome) VALUES (21, 'Dra. Caroline');
INSERT INTO autor (id, nome) VALUES (22, 'Dra. Anthonia');
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela virus
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO virus (id, nome, descricao) VALUES ( 1, 'Retroviridae', 'RetrovÃ­rus envelopado');
INSERT INTO virus (id, nome, descricao) VALUES ( 2, 'FlavivÃ­rus', 'RNA envelopado - DENGUE');
INSERT INTO virus (id, nome, descricao) VALUES ( 3, 'Adenovirus', 'CONJUNTIVITE - GASTROENTERITES - FARINGITES');
INSERT INTO virus (id, nome, descricao) VALUES ( 4, 'APMV', 'Acanthamoeba polyphaga mimivirus');
INSERT INTO virus (id, nome, descricao) VALUES ( 5, 'HPV', 'Papillomaviridae (Human Papiloma Virus)');
INSERT INTO virus (id, nome, descricao) VALUES ( 6, 'Poxvirus', 'DNA envelopado');
INSERT INTO virus (id, nome, descricao) VALUES ( 7, 'Rinovirus', 'Herpesvirus');
INSERT INTO virus (id, nome, descricao) VALUES ( 8, 'Influenzavirus', 'GRIPE');
INSERT INTO virus (id, nome, descricao) VALUES ( 9, 'Paramixovirus', 'CAXUMBA');
INSERT INTO virus (id, nome, descricao) VALUES (10, 'Rubivirus', 'RUBÃ‰OLA');
INSERT INTO virus (id, nome, descricao) VALUES (11, 'Rabdovirus', 'Raiva(Hidrofobia)');
INSERT INTO virus (id, nome, descricao) VALUES (13, 'EnterovÃ­rus', 'Meningite viral');
INSERT INTO virus (id, nome, descricao) VALUES (15, 'HIV', 'Human immunodeficiency virus');
INSERT INTO virus (id, nome, descricao) VALUES (16, 'H1N1', 'Influenza A');
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela publicacao
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO publicacao (id, idContrato, idJornal, data, assunto, texto) VALUES (1, 1, 1, '2017-02-25', 'DoenÃ§as geriÃ¡tricas', 'As doenÃ§as geriÃ¡tricas...');
INSERT INTO publicacao (id, idContrato, idJornal, data, assunto, texto) VALUES (2, 2, 2, '2017-02-28', 'SupervÃ­rus', 'Alguns vÃ­rus evoluem rapidamente...');
INSERT INTO publicacao (id, idContrato, idJornal, data, assunto, texto) VALUES (3, 3, 4, '2017-03-22', 'DoenÃ§as de verÃ£o', 'Durante o verÃ£o...');
INSERT INTO publicacao (id, idContrato, idJornal, data, assunto, texto) VALUES (4, 4, 3, '2017-09-21', 'Falsos vÃ­rus', 'Durante muito tempo...');
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela publicacaoVirus
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO publicacaoVirus (idPublicacao, idVirus) VALUES (1, 3);
INSERT INTO publicacaoVirus (idPublicacao, idVirus) VALUES (1, 2);
INSERT INTO publicacaoVirus (idPublicacao, idVirus) VALUES (2, 1);
INSERT INTO publicacaoVirus (idPublicacao, idVirus) VALUES (3, 1);
INSERT INTO publicacaoVirus (idPublicacao, idVirus) VALUES (3, 4);
INSERT INTO publicacaoVirus (idPublicacao, idVirus) VALUES (4, 3);
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela publicacaoAutor
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (1, 7);
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (2, 7);
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (4, 7);
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (2, 1);
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (3, 2);
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (1, 3);
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (2, 3);
INSERT INTO publicacaoAutor (idPublicacao, idAutor) VALUES (4, 3);
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela publicacaoInstituicao
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO publicacaoInstituicao (idInstituicao, idPublicacao) VALUES (1, 2);
INSERT INTO publicacaoInstituicao (idInstituicao, idPublicacao) VALUES (1, 3);
INSERT INTO publicacaoInstituicao (idInstituicao, idPublicacao) VALUES (2, 2);
INSERT INTO publicacaoInstituicao (idInstituicao, idPublicacao) VALUES (3, 2);
INSERT INTO publicacaoInstituicao (idInstituicao, idPublicacao) VALUES (2, 1);
INSERT INTO publicacaoInstituicao (idInstituicao, idPublicacao) VALUES (3, 4);
COMMIT;

-- -----------------------------------------------------
-- INSERTs para a tabela referencias
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO referencias (idPublicacaoOrigem, idPublicacaoReferencia) VALUES (4, 1);
INSERT INTO referencias (idPublicacaoOrigem, idPublicacaoReferencia) VALUES (4, 3);
INSERT INTO referencias (idPublicacaoOrigem, idPublicacaoReferencia) VALUES (4, 2);
INSERT INTO referencias (idPublicacaoOrigem, idPublicacaoReferencia) VALUES (2, 1);
INSERT INTO referencias (idPublicacaoOrigem, idPublicacaoReferencia) VALUES (2, 3);
INSERT INTO referencias (idPublicacaoOrigem, idPublicacaoReferencia) VALUES (3, 1);
COMMIT;

-----consutas----



SELECT p.data, p.assunto, p.texto, v.nome
  FROM publicacao p INNER JOIN publicacaoVirus pv       ON p.id  = pv.idPublicacao
            INNER JOIN virus v                  ON pv.idVirus      = v.id          
  WHERE v.nome = 'APMV';


-- Consulta com mais informaÃ§Ãµes
  SELECT p.data AS 'DATA PUB.', p.assunto AS 'ASSUNTO',
         j.nome AS 'JORNAL', j.volume AS 'VOLUME', j.edicao AS 'EDIÃ‡ÃƒO',
       c.numero AS 'NR. CONTRATO', c.dataInicio AS 'CONTR. INICIO', c.dataTermino AS 'CONTR. TÃ‰RMINO', c.valor AS 'CONTR. VLR.',
       i.nome AS 'INSTITUIÃ‡ÃƒO',
       a.nome AS 'AUTOR',
       v.nome AS 'VÃRUS'    
  FROM publicacao p INNER JOIN jornal j                 ON p.idJornal       = j.id  
                    INNER JOIN contrato c               ON p.idContrato     = c.id
            INNER JOIN publicacaoInstituicao ip ON p.id   = ip.idPublicacao
            INNER JOIN instituicao i            ON ip.idPublicacao = i.id
            INNER JOIN publicacaoAutor ap       ON p.id   = ap.idPublicacao
            INNER JOIN autor a                  ON ap.idAutor       = a.id
            INNER JOIN publicacaoVirus pv       ON p.id   = pv.idPublicacao
            INNER JOIN virus v                  ON pv.idVirus       = v.id      
  WHERE v.nome ;


SELECT p.*,
       a.nome    
  FROM publicacao p INNER JOIN publicacaoAutor ap           ON p.id   = ap.idPublicacao
            INNER JOIN autor a                      ON ap.idAutor       = a.id        
  WHERE a.nome = 'DR. MICHELL';

  SELECT p.*,
       c.numero, c.dataInicio, c.dataTermino, c.valor    
  FROM publicacao p INNER JOIN contrato c                   ON p.idcontrato     = c.id         
  WHERE c.numero = 515;



DELIMITER $$

DROP PROCEDURE IF EXISTS InsereAutomatico;
$$

CREATE PROCEDURE InsereAutomatico(valorContrato DECIMAL(9,2),
                                  dataInicioContrato DATE,
                                  assuntoPublicacao VARCHAR(45),
                                  dataPublicacao DATE,
                                  nomeJornal VARCHAR(50),
                                  nomeInstituicao VARCHAR(45),
                                  nomeAutor VARCHAR(45),
                                  nomeVirus VARCHAR(50))
                          
BEGIN

DECLARE numeroContrato INT DEFAULT 0;
DECLARE dataTermino DATE;
DECLARE idContrato INT;
DECLARE idJornal INT;
DECLARE idPublicacao INT;
DECLARE idInstituicao INT;
DECLARE idAutor INT;
DECLARE idVirus INT;


SET numeroContrato = (SELECT MAX(id) FROM contrato LIMIT 1);

SET dataTermino = (SELECT DATE_ADD(dataInicioContrato,INTERVAL +90 DAY) );

SET idJornal = (SELECT id FROM Jornal WHERE nome = nomeJornal LIMIT 1);

SET numeroContrato = YEAR(NOW()) * numeroContrato;


INSERT INTO contrato (numero, dataInicio, dataTermino, valor) 
VALUES (numeroContrato, dataInicioContrato, dataTermino, valor);

SET idContrato = (SELECT MAX(id) FROM contrato LIMIT 1);

INSERT INTO publicacao(idContrato,idJornal, data, assunto, texto, abstract)
VALUES (idContrato, idJornal, dataPublicacao, assuntoPublicacao, null, "null");

SET idPublicacao = (SELECT MAX(id) FROM publicacao LIMIT 1);

SET idInstituicao = (SELECT id FROM instituicao WHERE nome = nomeInstituicao LIMIT 1);

SET idAutor = (SELECT id FROM autor WHERE nome = nomeAutor LIMIT 1);

SET idVirus = (SELECT id FROM virus WHERE nome = nomeVirus LIMIT 1);

INSERT INTO publicacaoInstituicao(idPublicacao, idInstituicao)
VALUES(idPublicacao, idInstituicao);

INSERT INTO publicacaoAutor (idPublicacao, idAutor)
VALUES(idPublicacao, idAutor);

INSERT INTO publicacaoVirus(idPublicacao,idVirus)
VALUES(idPublicacao,idVirus);

END $$

DELIMITER ;


CALL InsereAutomatico(10,'2010-03-06','nova','2010-04-05','Jornal A Trombeta','SENAC','Dr. William','Paramixovirus');


SELECT contrato.valor AS 'valorContrato', contrato.dataInicio AS 'dataInicio contrato',contrato.dataTermino AS 'dataTermino',
publicacao.assunto AS 'assunto publicacao', publicacao.data AS 'data da publicacao',
jornal.nome AS 'Nome do jornal',
instituicao.nome AS 'Nome da instituicao',
autor.nome AS 'Nome Autor',
virus.nome AS 'Nome virus'
FROM publicacao 
INNER JOIN contrato ON publicacao.idContrato = contrato.id
INNER JOIN jornal ON publicacao.idJornal = jornal.id
INNER JOIN publicacaoinstituicao ON publicacao.id = publicacaoinstituicao.idPublicacao
INNER JOIN instituicao ON publicacaoinstituicao.idInstituicao = instituicao.id
INNER JOIN publicacaoautor ON publicacao.id = publicacaoautor.idPublicacao
INNER JOIN autor ON publicacaoautor.idAutor = autor.id
INNER JOIN publicacaovirus ON publicacao.id = publicacaovirus.idPublicacao
INNER JOIN virus ON publicacaovirus.idVirus = virus.id;