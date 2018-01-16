require 'json'
require 'mysql2'

DB = '4Patas'
HOST = 'localhost'
USERNAME = 'root'
PASSWORD = ''

client = Mysql2::Client.new(host: HOST, username: USERNAME, password: PASSWORD, database: DB)
txt = []


clientes = client.query("SELECT C.cartão_cidadão, C.nome, C.email, C.telefone, C.rua, C.localidade, C.código_postal 
						 FROM Cliente AS C" )

clientes.each do |cliente|
	animais = client.query("SELECT A.id_animal AS IDAnimal, A.nome AS Nome, A.espécie AS Espécie, A.raça AS Raça, A.nascimento AS Nascimento, A.peso AS Peso 
							FROM Animal AS A
							WHERE A.Cliente_cartão_cidadão = '#{cliente['cartão_cidadão']}'")

	txt << {
		'Cartão de Cidadão' => cliente['cartão_cidadão'],
		'Nome' => cliente['nome'],
		'Email' => cliente['email'],
		'Telefone' => cliente['telefone'],
		'Rua' => cliente['rua'],
		'Localidade' => cliente['localidade'],
		'Código-Postal' => cliente['código_postal'],
		'Animais' => animais.to_a
	}
end
	txt.each do |pr|
		puts JSON.pretty_generate(pr)
	end
