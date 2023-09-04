.data
	enter_message: .asciiz "Ingresa un n�mero: "
	result_message: .asciiz "El n�mero mayor es: "
.text
main:
	# Asignando el contador a $t0
	li $t0, 0
	
	# Asignando el menor a $t1. Suponiendo que el m�nimo n�mero sea 0
	li $t1, 0
	
loop:
	# Si $t0 == 3, terminar loop
	beq $t0, 3, end_loop
	
	# Incrementar el contador $t0 = $t0 + 1
	add $t0, $t0, 1
	
	# Imprime: "Ingresa un n�mero"
	li $v0, 4
	la $a0, enter_message
	syscall
	
	# Introduciendo n�mero a $t2
	li $v0, 5
	syscall
	move $t2, $v0
	
	# Asigna a $t3 si $t2 > $t1
	sgt $t3, $t2, $t1
	
	
	# Si $t3 == 0, significa que el n�mero no es mayor, 
	# entonces repetir el loop
	beq $t3, 0, loop
	
	# Si llega hasta aqu�, $t2 > $t1, entonces hacer asignaci�n
	move $t1, $t2
	j loop
	

end_loop:
	
	# Imprime "El numero mayor es: "
	li $v0, 4
	la $a0, result_message
	syscall
	
	# Imprime $t1 (el n�mero mayor)
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall