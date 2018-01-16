require 'json'
require 'mysql2'

DB = '4Patas'
HOST = 'localhost'
USERNAME = 'root'
PASSWORD = ''

client = Mysql2::Client.new(host: HOST, username: USERNAME, password: PASSWORD, database: DB)
a = []                         
b = []

consultas = client.query("SELECT C.id_consulta, C.data_consulta, C.hora_início, C.hora_fim, C.preço, C.Animal_id_animal, M.nome AS nMedico, 
						 D.observações AS Obs, D.id_diag AS idiag, Med.nome AS medn , Med.dosagem AS medd , V.nome AS vacn, V.dosagem AS vacd,
						 C.Animal_id_animal
						 FROM Diagnóstico AS D
						 INNER JOIN Consulta AS C ON C.id_consulta = D.Consulta_id_consulta
						 INNER JOIN Médico AS M ON M.id_médico = C.Médico_id_médico
						 INNER JOIN Medicamentos AS Med ON Med.Diagnóstico_id_diag = D.id_diag
						 INNER JOIN Vacinas AS V ON V.Diagnóstico_id_diag = D.id_diag
						 ")

consultas.each do |consulta|
	medicamentos = client.query("SELECT M.nome AS Nome, M.dosagem AS Dosagem
								 FROM Medicamentos AS M
								 WHERE M.Diagnóstico_id_diag = #{consulta['idiag']}
		")

	vacinas = client.query("SELECT V.nome AS Nome, V.dosagem AS Dosagem
								 FROM Vacinas AS V
								 WHERE V.Diagnóstico_id_diag = #{consulta['idiag']}
		")
	a << {
		'Data' => consulta['data_consulta'],
		'Hora Início' => consulta['hora_início'],
		'Hora Fim' => consulta['hora_fim'],
		'Preço' => consulta['preço'].to_f,
		'Médico' => consulta['nMedico'],
		'IDAnimal' => consulta['Animal_id_animal'],
		'Diagnóstico' => {'Observações' => consulta['Obs'],
						  'Medicamentos' => medicamentos.to_a,
						  'Vacinas' => vacinas.to_a
						 }
		}
	
	


	end

semdiag = client.query("SELECT C.id_consulta, C.data_consulta, C.hora_início, C.hora_fim, C.preço, C.Animal_id_animal, M.nome AS nmedico
						FROM Consulta AS C
						LEFT JOIN Diagnóstico AS D
						ON C.id_consulta = D.Consulta_id_consulta
						INNER JOIN Médico AS M
                        ON M.id_médico = C.Médico_id_médico
                        WHERE D.Consulta_id_consulta IS NULL
                        "
						 )
semdiag.each do |sdiag|	

	b << {
		'Data' => sdiag['data_consulta'],
		'Hora Início' => sdiag['hora_início'],
		'Hora Fim' => sdiag['hora_fim'],
		'Preço' => sdiag['preço'].to_f,
		'Médico' => sdiag['nmedico'],
		'IDAnimal' => sdiag['Animal_id_animal'],
		'Diagnóstico' => {'Observações' => nil,
						  'Medicamentos' => { 'Nome' => nil, 'Dosagem' => nil},
						  'Vacinas' => {'Nome' => nil, 'Dosagem' => nil}
						 }
		}
	end
	a.each do |pr|
		puts JSON.pretty_generate(pr)
	end
	b.each do |pr1|
		puts JSON.pretty_generate(pr1)
	end