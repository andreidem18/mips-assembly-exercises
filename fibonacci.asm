.data
	welcome_message: .asciiz "Sucesión de fibonacci hasta 10 números"
	separator: .asciiz ", "
	
.text
main:
	# Asignando al contador ($t0) el valor 0
	li $t0, 0
	
	# Asignando a $t1 y $t2 los dos últimos números de la sucesión
	# (Empiezan en 0 y 1)
	li $t1, 0
	li $t2, 1
	
	
	# Imprime mensaje de bienvenida
	li $v0, 4
	la $a0, welcome_message
	syscall
	# Salto de línea
	li   $v0, 11   
	li   $a0, 0xA  
	syscall
	
	
	# Imprimiendo el primer numero ($t1)
	li $v0, 1
	move $a0, $t1
	syscall
	# Separador ", "
	li $v0, 4
	la $a0, separator
	syscall
	
loop:
	# Imprimiendo el ultimo numero ($t2)
	li $v0, 1
	move $a0, $t2
	syscall
	# Separador ", "
	li $v0, 4
	la $a0, separator
	syscall
	
	
	# Si $t0 == 10, terminar el loop
	beq $t0, 10, end_loop
	
	# Incrementando el contador $t0 = $t0 + 1
	add $t0, $t0, 1
	
	
	# Creando una variable auxiliar $t3, donde poner la suma de $t1 + $t2
	add $t3, $t1, $t2
	
	# Penultimo = ultimo
	move $t1, $t2
	
	# ultimo = auxiliar 
	move $t2, $t3
	
	# Repetir loop
	j loop
	
	
end_loop:

	li $v0, 10
	syscall
	