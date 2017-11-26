USE `4Patas`;
CREATE VIEW Contactos AS
SELECT Animal.nome AS 'Animal',cli.nome AS 'Cliente',cli.telefone AS 'Contacto'
FROM Animal
INNER JOIN Cliente AS cli ON Animal.Cliente_cartão_cidadão = cli.cartão_cidadão
ORDER BY Animal.nome

#SELECT * FROM Consultas; 
#DROP VIEW Consultas; 
