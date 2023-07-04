.data 
	msg1: .asciiz "Insira um numero "
	msg2: .asciiz "Numero é positivo"
	msg3: .asciiz "Numero é negativo"
	
.text
	li $v0, 4 		# 4 é um código para imprimir string (print string)
	la $a0, msg1		# salva o argumento a0 como a msg1
	syscall 		#chamada de sistema
	li $v0, 5		# 5 é um código para ler inteiro 
	syscall 
	add $s0, $v0, $zero	#armazenando valor de $v0 em $s0
	slti $t0, $s0, 0	# se $s0 menor que 0, entao é negativo (mas vai dar como $t0 == 1)
	beq $t0, 1, NumeroNegativo
	beq $t0, 0, NumeroPositivo
	j NumeroNegativo
	
		NumeroPositivo:
				li $v0, 4 		# 4 é um código para imprimir string (print string)
				la $a0, msg2		# numero é positivo
				syscall
				j fim
		NumeroNegativo:
				li $v0, 4 		# 4 é um código para imprimir string (print string)
				la $a0, msg3		# numero é negativo
				syscall
		fim:
		li $v0,10 
		syscall
				  		
	 