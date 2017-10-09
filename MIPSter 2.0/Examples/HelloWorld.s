# PROGRAM: Hello, World!

	.data		# Data declaration section

	out_string: .asciiz "\nHello, World!\n"

	.text

main:	# Start of code section
	li $v0, 4		# system call code for printing string = 4
	la $a0, out_string	# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

# BLANK LINE AT THE END TO KEEP SPIM HAPPY!

