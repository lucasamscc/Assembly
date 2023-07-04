.data
	
	msg1: .asciiz "Digite os dias "
	msg2: .asciiz " anos, "
	msg3: .asciiz " meses, "
	msg4: .asciiz " dias."	

.text
	li $v0, 4 		# 4 é um código para imprimir string (print string)
	la $a0, msg1		# salva o argumento a0 como a msg1
	syscall 		#chamada de sistema
	li $v0, 5		# 5 é um código para ler inteiro 
	syscall 
	
	add $s0, $v0, $zero
	
	li $t0, 30
	li $t1, 360
	
	div $s0, $t1
	mflo $t2 # anos 
	
	div $s0, $t1
	mfhi $t3 
	move $s1, $t3
	div $s1, $t0 
	mflo $t4 # meses
	
	div $s1, $t0
	mfhi $t5 #dias
	
	
	#começar a imprimir o resultado
	li $v0,1
	move $a0, $t2
	syscall
	
	li $v0, 4      # anos,
	la $a0, msg2
	syscall
	
	li $v0,1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, msg3  # meses, 
	syscall
	
	li $v0,1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, msg4  # dias, 
	syscall
	
		li $v0,10 
		syscall
	
	
	
	
	
	