/*
3) Crie uma consulta para listar o somatÃ³rio de ingressos vendidos para cada filme onde o tipo de pagamento foi
parcelado. Liste o nome do filme e o somatÃ³rio de valor de ingressos.
*/
	SELECT * FROM tipoPagto;
	SELECT * FROM venda;
DROP PROCEDURE IF EXISTS passo3;
DELIMITER $$
CREATE PROCEDURE passo3()
BEGIN

	SELECT filme.tituloPortugues, SUM(venda.valorIngresso)
	FROM filme
	INNER JOIN sessao ON filme.id = sessao.idFilme
	INNER JOIN venda ON sessao.id = venda.idSessao
	INNER JOIN tipoPagto ON venda.idTipoPagto = tipoPagto.id
	WHERE tipoPagto.nome = "Parcelado"
	GROUP BY filme.tituloPortugues;

	END $$
	DELIMITER ;

CALL passo3();


	/*
4)Altere a consulta anterior para que, utilizando a propriedade HAVING
, a consulta que liste somente os filmes com mais de 3 ingressos vendidos (cadastre mais vendas se necessário)
	*/
DROP PROCEDURE IF EXISTS passo4;

DELIMITER $$
CREATE PROCEDURE passo4()
BEGIN

SELECT filme.tituloPortugues, COUNT(venda.id)
FROM filme
INNER JOIN sessao ON filme.id = sessao.idFilme
INNER JOIN venda on sessao.id = venda.idSessao
GROUP BY filme.tituloPortugues
HAVING COUNT(venda.id)>= 3; 

END $$
DELIMITER ;

CALL passo4();

/*
5)
Crie uma consulta para listar quantos usuários efetuaram compras à vista.
*/

DROP PROCEDURE IF EXISTS passo5;

DELIMITER $$
CREATE PROCEDURE passo5()

BEGIN

SELECT filme.tituloPortugues
FROM ve

/*
7) Crie uma stored procedure alteraValorIngresso(valor) que defina um novo valor aos ingressos jÃ¡ vendidos
por um valor informado na chamada da procedure, listando os ingressos em seguida na prÃ³pria procedure;
*/
	DROP PROCEDURE IF EXISTS alteraValorIngresso;
	DELIMITER $$
	CREATE PROCEDURE alteraValorIngresso(val double)
	BEGIN
		UPDATE venda SET valorIngresso = val;
		SELECT * FROM venda;
	END $$
	DELIMITER ;

	-- Exemplo de chamada da Procedure
	CALL alteraValorIngresso(20.55);


