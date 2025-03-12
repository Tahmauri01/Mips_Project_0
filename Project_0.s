.data
	id:	.asciiz "@03134060"		# Howard ID

.text
.globl main

main:
	li $t0, 4		#This is N
	li $t1, 1		#This is m

for_loop:
	bge $t1, 10, exit		#If m > 9 exits loop

	add $t2, $t1, $t0 		#Adds m and N
	rem $t2, $t2, 9			#Does (m + N) % 9

	la $a0, id				#Loads the id
	move $a1, $t2			#stores the starting index
	jal print_substring		#calls print_substring function

	la $a0, 10				#ascii for '\n' newline
	li $v0, 11				#print
	syscall					#prints the new line

	addi $t1, $t1, 1		#adds 1 to m every loop
	j for_loop				#starts the loop again

print_substring:
	add $t3, $a0, $a1			#Adds base address and index to get the value of the index you want
	li $t4, 9					#Counter for the loop

print_loop:
	lb $a0, 0($t3)				#loading the character at this current address