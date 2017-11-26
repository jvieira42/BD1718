USE `4Patas`;
CREATE VIEW Consultas AS
SELECT Consulta.data_consulta AS 'Data', Consulta.id_consulta AS 'Consulta', Consulta.preço AS 'Preço'
FROM Consulta
ORDER BY data_consulta

#DROP view Consultas;
#SELECT * FROM Consultas