USE `4PATAS`;
-- Procura dos animais de um cliente
DELIMITER $$

CREATE PROCEDURE NomeCliente(IN cliente_cc VARCHAR(64))

BEGIN
SELECT A.Nome FROM Cliente AS C
	INNER JOIN Animal As A
    ON A.Cliente_cartão_cidadão = C.cartão_cidadão
    WHERE (C.cartão_cidadão = cliente_cc);
END $$

SET @cliente_cidadao = '082735831ZZ6';
CALL NomeCliente(@cliente_cidadao);
DROP PROCEDURE NomeCliente;
