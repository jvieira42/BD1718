USE `4patas`;
-- Pesquisa das consultas de um médico entre duas datas
DELIMITER $$
CREATE PROCEDURE procedureInsertConsulta(IN dia DATE,IN horaInicio DATE,IN horaFim DATE, IN nome_m VARCHAR(64), IN nome_animal VARCHAR(64))
IF   
(SELECT COUNT(*) FROM Consulta AS C 
	WHERE (C.data_consulta = dia) AND (C.hora_início = horaInicio) AND (C.hora_fim = horaFim) AND (M.nome = nome_m)) = 0
BEGIN  
	SET @idConsulta =   
        (SELECT MAX(id_consulta)   
         FROM consulta)+1;
    SET @idMedico =   
        (SELECT MAX(id_médico)   
         FROM médico   
         WHERE médico.nome = nome_m);      
    INSERT INTO Consulta(id_consulta, data_consulta, hora_início, hora_fim, preço, Médico_id_médico, Diagnóstico_id_diag)
	VALUES
		(idConsulta,dia,horaInicio,horaFim,0,idMedico,null);     
END $$
