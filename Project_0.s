.data
	id:	.asciiz "@03134060"		# Howard ID

.text
.globl main

main:
	li $t0, 4
	li $t1, 1

for_loop:
	bge $t1, 10, exit

exit:
	