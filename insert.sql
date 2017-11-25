USE `4patas`;
-- Pesquisa das consultas de um médico entre duas datas
DELIMITER $$
CREATE PROCEDURE procedureInsertConsulta(IN dia DATE,IN horaInicio TIME,IN horaFim TIME, IN nome_m VARCHAR(64), IN nome_animal VARCHAR(64))
IF   
(SELECT COUNT(*) FROM Consulta AS C 
	WHERE (C.data_consulta = dia) AND (M.nome = nome_m) AND (SELECT MAX(horaInicio,hora_início)) < (SELECT MIN(horaFim,hora_fim))) = 0
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
