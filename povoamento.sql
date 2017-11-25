
USE `4patas`;

INSERT INTO Cliente(cartão_cidadão, nome, email, telefone, rua, localidade, código_postal)
VALUES 
		('000000000ZZ4','Paula Ávila', 'paula_avila@gmail.com', 915456441, 'Travessa Doutora Judite Barata, 23', 'Leiria', '2410-385 LEIRIA'),
        ('045212244ZZ7','João Matos', 'joao_matos@gmail.com', 967428542, 'Rua de Tomar, 12', 'Leiria', '2410-186 LEIRIA'),
        ('055256123ZZ3','João Vieira', 'jonez_vieira@hotmail.com',  967456128, 'Rua da Rocha Quebrada, 65', 'Pedrogão Grande', '3270-106 LEIRIA'),
        ('104938573ZZ5','Filipe Fortum', 'fortunato_sqn@gmail.com', 917476361, 'Rua das Taipas, 10', 'Barreira', '2410-340 LEIRIA'),
        ('034523569ZZ2','Rui Vieira', 'rui_rabexim@hotmail.com', 928573421, 'Rua dos Moreirinhas, 120', 'Boa Vista', '2420-414 LEIRIA'),
        ('054738491ZZ7','Manuel Montes', 'curopos68@gmail.com', 917552324, 'Rua das Azáleas, 34', 'Coimbrão', '2425-457 LEIRIA'),
        ('082735831ZZ6','José Pirito', 'piro_naspuras@hotmail.com', 962147754, 'Rua de Lima, 127', 'Leiria', '2400-530 LEIRIA'),
        ('123533413ZZ0','Hank Moody', 'cali_holly@gmail.com', 925356643, 'Rua dos Escritores, 67', 'Colmeias', '2425-333 LEIRIA'),
        ('043275817ZZ8','Maria Fernão', 'mariazinha21@hotmail.com', 968682301, 'Rua dos Cunhais, 55', 'Leiria', '2455-379 LEIRIA'),
        ('033532140ZZ1','Sara Pereira', 'dolly_sara@gmail.com', 918778909, 'Rua das Lamaças, 87', 'Leiria', '2487-299 LEIRIA'),
        ('135345332ZZ2','Adriana Guedes', 'candace122@hotmail.com', 925667443, 'Travessa das Poucas Aguiar, 221', 'Leiria', '2465-222 LEIRIA'),
		('068001853ZZ6','Inês Moreira', '2jaera_ines@gmail.com', 918587341, 'Rua da Vergonha, 1', 'Leiria', '2480-336 LEIRIA'),
		('076120341ZZ8','Ana Frade', 'ana_frade@gmail.com', 915456441, 'Travessa dos Artistas, 9', 'Leiria', '2405-345 LEIRIA'),
		('014560922ZZ1','Diogo Soares', 'stifi_pi@gmail.com', 926547705, 'Travessa das Nogueiras, 55', 'Pedrogão Grande', '3278-420 LEIRIA'),
		('156328001ZZ0','Sofia Brito', 'sofia_artes@hotmail.com', 917643310, 'Ruas dos Massas, 100', 'Pedrogão Grande', '3350-050 LEIRIA');


INSERT INTO Médico(id_médico, nome)
VALUES
		(1,'Telmo Leitão'),
        (2,'Inês Mendes'),
        (3,'Manuel Campos'),
        (4,'Jorge de Matos'),
        (5,'Iva Carreiro');
        
        
INSERT INTO Animal(id_animal, nome, espécie, raça, nascimento, peso, Cliente_cartão_cidadão)
VALUES
		(1,'Shazod','Cão','Pug','2012-06-21','9.5 kg','123533413ZZ0'),
        (2,'Cucas','Gato','Ragdoll','2010-10-12','4.2 kg','043275817ZZ8'),
        (3,'Ágata','Cão','Beagle','2015-02-09','5.6 kg','014560922ZZ1'),
        (4,'Ace','Cão','Pastor-Alemão','2008-08-11','15.6 kg','156328001ZZ0'),
        (5,'Eletro','Gato','Persa','2012-01-13','3.5 kg','076120341ZZ8'),
        (6,'Dolly','Ovelha','Merino','2006-05-29','40.8 kg','068001853ZZ6'),
        (7,'Rafiki','Gato','Siamês','2013-09-14','5.4 kg','135345332ZZ2'),
        (8,'Ruca','Cão','Bulldog','2005-02-22','15.2 kg','033532140ZZ1'),
        (9,'Lili','Gato','Bombaim','2002-05-05','3.8 kg','045212244ZZ7'),
        (10,'Tumba','Cão','Cão-de-fila','2001-01-30','15.5 kg','082735831ZZ6'),
        (11,'Tshabs','Cão','Salsicha','2009-10-28','4.1 kg','054738491ZZ7'),
        (12,'Milka','Gato','Pixie-bob','2008-04-17','2.9 kg','034523569ZZ2'),
        (13,'Ryu','Cão','São Bernardo','2002-04-12','90.9 kg','104938573ZZ5'),
        (14,'Dona','Cão','Poodle','2011-06-27','3.5 kg','055256123ZZ3'),
        (15,'Paquito','Cão','Pitbull','2009-08-02','35.2 kg','000000000ZZ4'),
		(16,'Camal','Hamster ','roborovski','2016-05-01','20 g','043275817ZZ8'),
        (17,'Mill','Iguana','Verde','2015-12-20','3.5 kg','082735831ZZ6'),
        (18,'Camel','Camaleão','Verde','2016-10-22','3 kg','082735831ZZ6'),
        (19,'Tata','Iguana','Verde','2015-12-20','3.5 kg','082735831ZZ6'),
        (20,'Kiara','Cão','Bulldog','2013-11-09','15 kg','104938573ZZ5'); 
          
INSERT INTO Consulta(id_consulta, data_consulta, hora_início, hora_fim, preço, Médico_id_médico, Animal_id_animal)
VALUES
		(1,'2017-08-08','09:00','10:00','50',2,1),
        (2,'2017-08-08','10:00','11:00','50',3,15),
        (3,'2017-08-09','09:00','10:00','50',1,3),
        (4,'2017-08-10','10:00','11:00','20',4,9),
        (5,'2017-08-10','15:00','15:30','30',2,4),
        (6,'2017-08-11','10:00','11:00','20',3,10),
        (7,'2017-08-11','11:00','12:30','40',4,9),
		(8,'2017-08-11','14:00','14:30','40',5,6),
		(9,'2017-08-12','11:00','12:00','40',5,11),
		(10,'2017-08-12','14:00','14:30','40',4,13);

INSERT INTO Diagnóstico(id_diag, observações,Consulta_id_consulta)  -- 15 consultas para os 15 caes
VALUES
		(1,'Não andar em espaço publico por 2 semanas',1),
        (2,'Arranha(ter cuidado na prox. consulta)',2),
        (3,'Nada a obs.',3),
        (4,'Nada a obs.',4),
        (5,'Angitimal está saudavel mas ter percaução',5),
        (6,'Nada a obs.',6),
        (7,'Tomar 1 comprimido por dia',7),
        (8,'Pesado! Perder peso!',8),
        (9,'Nada a obs.',9),
        (10,'Não andar em espaço publico por 1 semana',10);
       /* (11,'Nada a obs.',11),
        (12,'Nada a obs.',12),
        (13,'Recuperação lenta, mas ainda possível',13),
        (14,'Muito Magro, acrescentar mais 1 refeição',14),
        (15,'Nada obs.',15);
*/


INSERT INTO Medicamentos(Diagnóstico_id_diag, id_med, nome, dosagem)
VALUES
		(1,1,'Analgésico','100 mg'),
        (2,2,'Xanax','0.25 mg'),
        (3,3,'Antibiótico','40 mg'),
        (4,4,'Figaron','20 mg'),
        (5,5,'Pestikill','10 mg'),
        (6,6,'Analgésico','200 mg'),
        (7,7,'Raspidixine','80 mg'),
        (8,8,'Valdespert','150 mg'),
        (9,9,'Grintuss','50 mg'),
        (9,10,'Camalix','129 mg');
        /*(11,11,'Jonesine','20 mg'),
        (12,12,'Zarovina','200 mg'),
        (13,13,'Leidon','41 mg'),
        (14,14,'Artronat','50 mg'),
        (15,15,'Tricovel','70 mg');
*/

INSERT INTO Vacinas(Diagnóstico_id_diag, id_vac, nome, dosagem)
VALUES
		(1,1,'Parvovirose','10 mg'),
        (1,2,'Leptoespirose','10 mg'),
        (2,3,'Parvovirose', '5 mg'),
        (3,4,'Tosse', '5 mg'),
        (4,5,'Triplíce','5 mg'),
        (5,6,'Parvovirose', '10 mg'),
        (6,7,'Desparasita', '10 mg'),
        (6,8,'Anti-Parasita', '10 mg'),
        (7,9,'Parvovirose, ','15 mg'),
        (9,10,'Anti-Parasita', '10 mg'),
        (9,11,'Desparasita', '10 mg'),
        (10,12,'Parvovirose', '10 mg' ),
        (10,13,'Anti-Parasita', '10 mg'),
        (10,14,'Desparasita', '10 mg'),
        (3,15,'Tosse','5 mg')    
        

  

 
