.data 
	msg1: .asciiz "Digite o primeiro numero "
	msg2: .asciiz "Digite o segundo numero "
	msg3: .asciiz "O primeiro numero é maior"
	msg4: .asciiz "O segundo numero é maior"

.text 
	li $v0, 4 		# 4 é um código para imprimir string (print string)
	la $a0, msg1		# salva o argumento a0 como a msg1
	syscall 		#chamada de sistema
	li $v0, 5		# 5 é um código para ler inteiro 
	syscall 
	add $s0, $v0, $zero	#armazenando valor 1 de v0 em $s0
	li $v0, 4	
	la $a0, msg2		# salva o argumento a0 como a msg2	
	syscall 	
	li $v0, 5	
	syscall
	add $s1, $v0, $zero	#armazenando valor 2 de v0 em $s1
	slt $t0, $s0, $s1	# se $s0 é menor que $s1, entao $t0 == 0
	beqz $t0, negativo	# se $t0 == 0, entao é falso (negativo) 
	beq $t0, 1, positivo 
	j negativo
	
	 positivo:
		li $v0, 4 	
		la $a0, msg4	#"O Segundo numero é maior"	
		syscall
		j fim
	 negativo: 
		li $v0, 4 	
		la $a0, msg3	#"O Primeiro numero é maior"	
		syscall 
	fim:
	li $v0,10 
	syscall
	 
	
	
	