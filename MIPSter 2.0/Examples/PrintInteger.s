# UNTITLED PROGRAM

	.data		# Data declaration section

	.text

main:			# Start of code section
	
	li $v0, 1	# system call code for print_int
	li $a0, 26	# integer to print
	syscall		# print it
	
# END OF PROGRAM
