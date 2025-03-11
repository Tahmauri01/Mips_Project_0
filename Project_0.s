.data
	id:	.asciiz "@03134060"		# Howard ID

.text
.globl main

main:
	la $t0, id		#loads the address of the id
	addi $t1, $t0, 9	#sets $t1 to 9 plus $t0 so loop can reach $t1
	j loop			#jumps to loop

exit:
	li $v0, 10		#ends the program
	syscall
	

loop:
	lb $a0, ($t0)		#loads a byte from the address
	li $v0, 11		#prints the byte
	syscall
	addi $t0, $t0, 1	#adds 1 to $t0
	
	beq $t0, $t1, exit	#checks if $t0 equals to nine and exits the program
	
	j loop			#jumps to loop

