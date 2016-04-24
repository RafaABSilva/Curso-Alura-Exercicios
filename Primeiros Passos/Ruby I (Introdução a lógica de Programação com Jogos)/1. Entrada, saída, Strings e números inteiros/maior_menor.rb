def da_boas_vindas
	puts "\nBem Vindo ao Jogo de Adivinhação!"
	puts "\nQual é o seu nome?"
	nome = gets.strip
	puts "\nComeçaremos o jogo para você, #{nome}."
	nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
    dificuldade = gets.to_i
end

def sorteia_numero dificuldade
	case dificuldade
		when 1
			maximo = 30
		when 2
			maximo = 60
		when 3
			maximo = 100
		when 4
			maximo = 150
		else
			maximo = 200
		end
	puts "Escolhendo um número de 1 á #{maximo}..."
	numero_sorteado = rand(maximo) + 1
	puts "Escolhido... Que tal adivinhar hoje o nosso número secreto?"
	numero_sorteado
end

def pede_um_numero tentativas, limite_de_tentativas, chutes
	puts "\nTentativa  #{tentativas.to_s} de #{limite_de_tentativas.to_s}."
	puts "Chutes até agora: #{chutes.to_s}." 
	puts "Entre com o número"
	chute = gets.strip
	puts "Será que você acertou? Você chutou #{chute}."
	chute.to_i
end 

def verifica_se_acertou numero_secreto, chute
	acertou = chute == numero_secreto
	if acertou
		puts "Acetou!"
		return true
	end
	if chute < numero_secreto
		puts "o número secreto é maior!"
	else
		puts "o número secreto é menor!"
	end
	false
end

def jogar( nome, dificuldade)
	numero_secreto = sorteia_numero dificuldade

	limite_de_tentativas = 5
	chutes = []
	pontos_ate_agora = 1000

	for tentativas in 1..limite_de_tentativas
		chute = pede_um_numero tentativas, limite_de_tentativas, chutes

		chutes << chute

		if nome.upcase == "RAFAEL"
			puts "Acetou!"
			break
		end
	    pontos_a_perder = (chute - numero_secreto).abs / 2.0
	    pontos_ate_agora = pontos_ate_agora - pontos_a_perder
		if verifica_se_acertou numero_secreto, chute
			break
		end
	end
	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    nao_quero_jogar = gets.strip
    nao_quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do 
	jogar nome, dificuldade
	if nao_quer_jogar
		break
	end
end

