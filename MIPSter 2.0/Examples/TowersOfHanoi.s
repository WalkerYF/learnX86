###################
# towers of hanoi
# recursive style
# nicholas r. rinard
# I worked with Fiona, Carolyn, Teddy, and Dave
# note:	xemacs has "features" like word has "features"
# This is MIPS assembler code which runs under SPIM and XSPIM. 
# It's never been tried on a real MIPS machine but theoretically it should work.
# 
# This code is the classic Towers of Hanoi in assembler.
# Actually, this code isn't "right". There are two variables/registers that are 
# switched so the whole problem is solved backward or something freaky like that.
	  
.text
.globl main

	bufsize = 10

main:	addiu	$sp,$sp,-40	# make room to save registers. lots of room
	sw	$fp,8($sp)	# save the frame pointer
	sw	$ra,4($sp)	# save the return address
	la	$fp,8($sp)	# compute new frame pointer (old stack pointer)

	la	$a0, prompt	# address of prompt string
	jal	print_string

	jal	read_int
	move	$a0,	$v0

	#INITIALIZE PARAMETERS
	add	$v0,	$zero,	$zero
	addi	$a1,	$zero,	1
	addi	$a2,	$zero,	2
	addi	$a3,	$zero,	3


	jal	hanoi		# call the function. oh joy
	
	la	$a0	total_moves_equals
	jal	print_string		# print "total moves equals"
	move	$a0,	$v0
	jal	print_int		# print "the answer"

	lw	$ra,	4($sp)
	jr	$ra
	
        .data 
prompt: .asciiz "Please enter a small number (1-5): "
total_moves_equals:	.asciiz	"Total moves equals: "

	
.text
.globl hanoi
hanoi:
	# PUSH THE STACK AND DECIDE WHETHER TO RECURSE
	add	$sp,	$sp,	-20	# push the stack for five pieces of data
	sw	$ra,	16($sp)		# store the return address in 16
	sw	$a0,	0($sp)		# store n in 0
	sw	$a1,	4($sp)		# store to in 4
	sw	$a2,	8($sp)		# store from in 8
	sw	$a3,	12($sp)		# store other in 12

	sgt	$t0,	$a0,	0	# decide whether we've exhaused our stack
	bnez	$t0,	hanoiLoop	# if not, don't do base case

	# BASE CASE
	add	$sp,	$sp,	20	# pop the stack pointer five words
	jr	$ra			# and go back from whence we came

hanoiLoop:
	# SET UP THE FIRST RECURSE
	add	$a0,	$a0,	-1	# decrement n (number of disks)
	move	$t1,	$a2		# store from in $t1
	move	$a2,	$a3		# put other into to
	move	$a3,	$t1		# put from into other
	jal	hanoi			# recurse to hanoi

	# AFTER THE RECURSE
	lw	$a0,	0($sp)		# load n back into register a0
	lw	$a1	4($sp)		# load to back into register a1
	lw	$a2,	8($sp)		# load from back into register a2
	lw	$a3,	12($sp)		# load other back into register a2
	lw	$ra,	16($sp)		# load the return address back into ra
					# add	$sp,	$sp,	20	# pop the stack

	# PRINT A STRING OF TEXT
	# good god is this a bit complicated or what?
	move	$t1,	$a0		# save the value of n
	la	$a0,	move_disk	
	jal	print_string		# print "move disk"
	move	$a0,	$t1
	jal	print_int		# print "n"
	la	$a0,	from
	jal	print_string		# print "from"
	move	$a0,	$a1
	jal	print_int		# print "this certain place"
	la	$a0,	to
	jal	print_string		# print "to"
	move	$a0,	$a2
	jal	print_int		# print "that other place"
	jal	newline			# print a newline

	move	$a0,	$t1		# put n back into a0
	add	$v0,	$v0,	1	# increment "moves" (return val)

	sub	$a0,	$a0,	1	# decrement n
	move	$t1,	$a1		# put to into safe storage
	move	$a1,	$a3		# put other into "to" place
	move	$a1,	$t1		# put to into "from"

	# RECURSE AGAIN
	jal	hanoi			# recurse on hanoi with new params

	lw	$ra,	16($sp)		# get back my return address
	add	$sp,	$sp,	20	# pop the stack
	jr	$ra




        .data
buf:    .space bufsize  
error:  .asciiz "Error in hex input.  Use only 1-8 characters 0-9A-Fa-f.  Try again.\n"
move_disk:	.asciiz "Move disk "
from:	.asciiz	" from "
to:	.asciiz	" to "

	

        # END PROCEDURE inputHisto
        #################################


	###############################################################
	# XSPIM SYSCALL FUNCTIONS   by David Kotz 1996, 2000.
	#    These are convenient functions for the syscalls.
	#    They make your syscalls more readable, and save
	#    the trouble of setting $v0.  Although it isn't usually
	#    the convention for the callee to save $v0, these functions
	#    save and restore $v0, for convenience.
	# Include this in any program you like, but do not change them! 
	################################################################
	
	#####################################################
	# PROCEDURE print_int
	#   Print an integer
	# Parameters:
	#  $a0	the integer
	# Return value:
	#  none
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl print_int

print_int:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,1		# print integer
	syscall
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra

	#####################################################
	# PROCEDURE print_float
	#   Print a float
	# Parameters:
	#  $f12	the float
	# Return value:
	#  none
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl print_float	

print_float:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,2		# print float
	syscall
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra

	#####################################################
	# PROCEDURE print_double
	#   Print a double
	# Parameters:
	#  $f12	the double
	# Return value:
	#  none
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl print_double	

print_double:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,3		# print double
	syscall
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra


	#####################################################
	# PROCEDURE print_string
	#   Print a string
	# Parameters:
	#  $a0	address of the null-terminated string
	# Return value:
	#  none
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl print_string	

print_string:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,4		# print string
	syscall
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra


	#####################################################
	# PROCEDURE read_int
	#   read an integer
	# Parameters:
	#  none
	# Return value:
	#  $v0 the integer

	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl read_int	

read_int:
	li	$v0,5		# read integer
	syscall
		
	jr	$ra

	#####################################################
	# PROCEDURE read_float
	#   read a float
	# Parameters:
	#  none
	# Return value:
	#  $f0 the float
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl read_float	

read_float:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,6		# read float
	syscall
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra

	#####################################################
	# PROCEDURE read_double
	#   read a double
	# Parameters:
	#  none
	# Return value:
	#  $f0 the double
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl read_double

read_double:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,7		# read double
	syscall
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra

	#####################################################
	# PROCEDURE read_string
	#    Read a string;  will read up to $a1-1 characters or a newline,
	#  whichever comes first, then append null byte.  
	#  Does not strip newline.
	# Parameters:
	#  $a0 address of the buffer to put the string
	#  $a1 length of the buffer
	# Return value:
	#  none  (buffer is overwritten)
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl read_string	
read_string:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,8		# read string
	syscall
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra

	#####################################################
	# PROCEDURE sbrk
	#    Allocate some memory, returning pointer.
	# Parameters:
	#  $a0 amount of memory desired (bytes)
	# Return value:
	#  $v0 address of memory allocated
	# Registers trashed:
	#  none (by this procedure)

	.text
	.globl sbrk	

sbrk:
	li	$v0,9		# sbrk
	syscall
	
	jr	$ra

	#####################################################
	# PROCEDURE exit
	#    exit the program
	# Parameters:
	#  none
	# Return value:
	#  none
	# Registers trashed:
	#  none

	.text
	.globl exit	
exit:
	addiu	$sp,$sp,-4	# room to save $v0
	sw	$v0,0($sp)	# save it

	li	$v0,10		# exit
	syscall
	
	# we should never get here!
	
	lw	$v0,0($sp)	# restore v0
	addiu	$sp,$sp,4
	
	jr	$ra


	#####################################################
	# PROCEDURE newline
	#    print a newline
	# Parameters:
	#  none
	# Return value:
	#  none
	# Registers trashed:
	#  none

	.text
	.globl newline
newline:
	addiu	$sp,$sp,-8	# room to save 2 regs
	sw	$a0,4($sp)
	sw	$v0,0($sp)

	li	$v0,4		# print string
	la	$a0, newline_char
	syscall
	
	lw	$a0,4($sp)
	lw	$v0,0($sp)
	addiu	$sp,$sp,8
	
	jr	$ra

	.data
newline_char:	.asciiz "\n"

# End Towers of Hanoi