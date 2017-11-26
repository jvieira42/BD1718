USE `4Patas`;
-- Pesquisa das consultas de um médico entre duas datas
DELIMITER $$
CREATE PROCEDURE procedureInsertCliente(IN cc varchar(12),IN nome1 varchar(64),IN mail varchar(64), 
					 IN telef int,IN rua1 varchar(48),IN locali varchar(32),IN cpostal varchar(32))
BEGIN
	DECLARE erro bool DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro=1;
    START TRANSACTION; 
    
    INSERT INTO Cliente(cartão_cidadão, nome, email, telefone, rua, localidade, código_postal)
	VALUES 
		(cc,nome1,mail,telef,rua1,locali,cpostal);
    
    IF erro
	THEN ROLLBACK; -- caso ocorra um erro, retrocede todas as instruções MySQL que executou
	ELSE COMMIT;
	END IF;
END; $$

SET @cc = '124228491ZZ4';
SET @nome = 'Renato Portoes';
SET @mail = 'renato233@gmail.com';
SET @telef = '913523824';
SET @rua = 'Avenida da Liberdade 36';
SET @localidade = 'Braga';
SET @cpostal = '4710-249 BRAGA';

CALL procedureInsertCliente(@cc,@nome,@mail,@telef,@rua,@localidade,@cpostal);

DROP procedure procedureInsertCliente;    

SELECT * FROM Cliente;




