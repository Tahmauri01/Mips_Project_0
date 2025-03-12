.data
	id:	.asciiz "@03134060"		# Howard ID

.text
.globl main

main:
	li $t0, 4		#This is N
	li $t1, 1		#This is m

for_loop:
	bge $t1, 10, back_start		#If m > 9 exits loop

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

back_start:
	li $t1, 1				#resets the counter for the backwards loop

back_loop:
	bge $t1, 10, exit		#if m is greater than or equal to 10 the loop stops

	li $t6, 20				#stores 20
	add $t2, $t6, $t0		#(N + 20)
	sub $t2, $t2, $t1		#(N + 20 - m)
	rem $t2, $t2, 9			#(N + 20 - m) % 9

	la $a0, id				#Load the id
	move $a1, $t2			#stores the starting index

	la $a0, 10				#print the id
	li $v0, 11				
	syscall

	addi $t1, $t1, 1		#adds 1 to m every loop
	j back_loop				#repeats the loop


print_substring:
	add $t3, $a0, $a1			#Adds base address and index to get the value of the index you want
	li $t4, 9					#Counter for the loop

print_loop:
	lb $a0, 0($t3)				#loading the character at this current address
	li $v0, 11					#print command
	syscall

	addi $t3, $t3, 1			#adds 1 to the base address to get next address
	addi $t4, $t4, -1			#subtracts one from counter to end the loop
	beqz $t4, done				#checks if the counter is 0

	lb $t5, 0($t3)				#loads the next character and checks for null
	beqz $t5, reset				#restarts from zero if it equals null
	j print_loop				#jumps to print_loop function

reset:
	la $t3, id					#Resets to the start of the string 
	j print_loop				#Continue printing

done:
	jr $ra						#returns to caller

exit:
	li $v0, 10					#exit command
	syscall

print_substring_reverse:
	add $t3, $a0, $a1			#gets the address of the integer you want
	li $t4, 9					#counter for number of characters to print

reversed_loop:
	lb $a0, 0($t3)				#loads the byte of the current address
	li $v0, 11					#print command
	syscall

	addi $t3, $t3, -1			#subtracts 1 to base character to go to the previous address
	addi $t4, $t4, -1			#subtracts 1 from the counter to end the loop
	beqz $t4, done_reversed		#checks if counter is 0

	la $t5, id					#loads the id
	bge $t3, $t5, reversed_loop		#restarts the loop
	
	add $t3, $t5, 8				#goes to the last character
	j reversed_loop				#Restarts the loop

done reversed:
	jr $ra						#returns to caller