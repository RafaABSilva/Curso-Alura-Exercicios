puts "\nBem Vindo ao Jogo de Adivinhação!"
puts "\nQual é o seu nome?"
nome = gets
puts "\nComeçaremos o jogo para você, " + nome
puts "Escolhendo um número de 0 á 200..."
	numero_secreto = 175
puts "Escolhido... Que tal adivinhar hoje o nosso número secreto?"
puts "\ntentativa 1"
puts "Entre com o número"
	chute = gets
puts "Será que você acertou? Você chutou " + chute
puts chute.to_i == numero_secreto 