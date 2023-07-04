.data
	msg1: .asciiz "Digite um numero "
	msg2: .asciiz "É Par.\n"
	msg3: .asciiz "É Impar.\n"
	 
.text

	
#	li $v0, 4 		# 4 é um código para imprimir string (print string)
#	la $a0, msg1		# salva o argumento a0 como a msg1
#	syscall 		#chamada de sistema
	
#	bne $v0, $zero, Continua 
	

	
	Continua:
		li $v0, 4 		# 4 é um código para imprimir string (print string)
		la $a0, msg1		# salva o argumento a0 como a msg1
		syscall 		#chamada de sistema
		
		li $v0, 5		# 5 é um código para ler inteiro 
		syscall 
		
		beq $v0, $zero, fim
		
		add $s0, $v0, $zero	#armazenando valor de $v0 em $s0
		li $s1, 2
		div  $s0, $s1		# testar a condição de par
		mfhi $t1		# pegar o resto
		beqz   $t1, Par		# se o resto é igual a zero, par
		j Impar
			Par:
				li $v0, 4 		# 4 é um código para imprimir string (print string)
				la $a0, msg2		# numero é par
				syscall
				j Continua		
			Impar:
				li $v0, 4 		# 4 é um código para imprimir string (print string)
				la $a0, msg3		# numero é impar
				syscall
				j Continua							
			fim:		
			li $v0,10 
			syscall
	
	
