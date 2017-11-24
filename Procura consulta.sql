USE `4patas`;
-- Pesquisa das consultas de um médico entre duas datas
DELIMITER $$
CREATE PROCEDURE procedureFindConsultas(IN Datai DATE,IN Dataf DATE, IN nome_m VARCHAR(64))
Begin

SELECT * FROM Consulta AS C 
	INNER JOIN Médico AS M
    ON M.id_médico = C.Médico_id_médico
		WHERE (C.data_consulta BETWEEN Datai AND Dataf) AND (M.nome = nome_m);
END $$

SET @datai = '2016-01-01';
SET @dataf = '2017-01-01';
SET @Nome_m = 'Manuel Campos';
CALL procedureFindConsultas(@datai,@dataf,@Nome_m);

DROP PROCEDURE procedureFindConsultas;
