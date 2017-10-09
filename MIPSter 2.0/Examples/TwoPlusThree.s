# EXAMPLE PROGRAM
# Adds 2 + 3 and prints the sum to the screen.

        .text
        .globl  main

main:
        ori     $8, $0, 2       # put 2 into register 8
        ori     $9, $0, 3       # put 3 into register 9
	add	$t0, $8, $9	# add register 8 and register 9, store the sum in $t0
	
	li	$v0, 1		# system call code for printing integer = 1
	move	$a0, $t0	# move integer to be printed into $a0: ($a0 = $t0)
	syscall			# call operating system to perform print

# END OF PROGRAM