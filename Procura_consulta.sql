USE `4patas`;
-- Pesquisa das consultas de um médico entre duas datas
DELIMITER $$
CREATE PROCEDURE procedureFindConsultas(IN Datai DATE,IN Dataf DATE, IN nome_m VARCHAR(64))
Begin

SELECT M.nome AS 'Nome Médico', data_consulta AS 'Data', hora_início AS 'Hora Inicio', hora_fim AS 'Hora Fim', preço AS 'Preço' FROM Consulta AS C 
	INNER JOIN Médico AS M
    ON M.id_médico = C.Médico_id_médico
		WHERE (C.data_consulta BETWEEN Datai AND Dataf) AND (M.nome  = nome_m);
END $$

SET @datai = '2017-01-01';
SET @dataf = '2018-01-01';
SET @Nome_m = 'Inês Mendes';

CALL procedureFindConsultas(@datai,@dataf,@Nome_m);

DROP PROCEDURE procedureFindConsultas;
