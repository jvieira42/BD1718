USE `4patas`;
-- Procura dos animais a quais foram prescrito o medicamento X
 
DELIMITER $$
CREATE PROCEDURE FindAnimalMedicamento(IN medicamento VARCHAR(64))

Begin
SELECT A.nome AS Nome FROM Animal AS A
	INNER JOIN Consulta AS C
    ON C.Animal_Id_Animal = A.id_Animal
		INNER JOIN Diagnóstico AS D
        ON D.Consulta_id_consulta = C.id_consulta
			INNER JOIN Medicamentos AS M
            ON M.Diagnóstico_id_diag = D.id_diag
				WHERE M.nome = medicamento;

END $$


SET @medicamento = 'Analgésico';

CALL FindAnimalMedicamento(@medicamento);

DROP PROCEDURE FindAnimalMedicamento;