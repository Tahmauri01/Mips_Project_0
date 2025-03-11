.data
	id:	.asciiz "@03134060"		# Howard ID

.text
.globl main

main:
	la $t0, id		#loads the address of the id
	lb $a0, ($t0)		#loads a byte from the address
	li $v0, 11		#prints the byte
	syscall
	
	li $v0, 10		#ends the program
	syscall