USE `4Patas`;

CREATE user 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON `4Patas`.* TO 'admin'@'localhost';

CREATE user 'funcionario'@'localhost' IDENTIFIED BY 'funcionario';
GRANT SELECT ON `4Patas`.* TO 'funcionario'@'localhost';
GRANT INSERT,UPDATE,DELETE ON `4Patas`.Consulta TO 'funcionario'@'localhost';
GRANT INSERT,UPDATE,DELETE ON `4Patas`.Animal TO 'funcionario'@'localhost';
GRANT INSERT,UPDATE,DELETE ON `4Patas`.Cliente TO 'funcionario'@'localhost';

CREATE user 'medico'@'localhost' IDENTIFIED BY 'medico';
GRANT SELECT ON `4Patas`.* TO 'medico'@'localhost';
GRANT INSERT,UPDATE,DELETE ON `4Patas`.* TO 'medico'@'localhost'; 
