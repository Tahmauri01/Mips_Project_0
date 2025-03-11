.data
	id:	.asciiz "@03134060"		# Howard ID

.text
.globl main

main:
	li $t0, 4		#loads the 4th element in $t0  (x in python)
	la $t1, id		#loads the id in $t1	(id in python)
	li $t4, 9		#loads 9 in $t4   (9 in python)

	j loop			#jumps to the loop  (for loop in python)


loop:
	addi $t0, $t0, 1
	bne $t0, $t4, loop
	