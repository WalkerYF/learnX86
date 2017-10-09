# EXAMPLE PROGRAM
# Computes Factorials
# The factorial of 5 is 120 because 5 * 4 * 3 * 2 * 1 = 120

	.text

fact:	# ALLOCATE A FRAME FOR THE DYNAMIC LINK, RETURN ADDRESS,
	# AND STATIC LINK (TOTAL: 3*4 = 12 BYTES)
	sw	$fp, ($sp)	# PUSH OLD FRAME POINTER (DYNAMIC LINK)
	move	$fp, $sp	# FRAME	POINTER NOW POINTS TO THE TOP OF STACK
	subu	$sp, $sp, 12	# ALLOCATE TWELVE BYTES IN THE STACK

	# SAVE RETURN ADDRESS IN FRAME
	sw	$ra, -4($fp)

	# SAVE STATIC LINK IN FRAME
	sw	$v0, -8($fp)
	
	# IF n>0 GOTO recurs (THE ARGUMENT n IS LOCATED AT 4($fp))
	lw	$a0, 4($fp)
	bgt	$a0, 1, recurs

	# OTHERWISE RETURN 1
	li	$v0, 1
	b	return
	
recurs:	# PUSH n-1 AS THE ARGUMENT TO fact
	lw	$a0, 4($fp)
	subu	$a0, $a0, 1
	sw	$a0, ($sp)
	subu	$sp, $sp, 4

	# LOAD STATIC LINK
	lw	$v0, -8($fp)

	# CALL fact
	jal	fact

	# MULTIPLY THE RESULT OF fact(n-1) BY n
	lw	$a0, 4($fp)
	mul	$v0, $v0, $a0

return:	# RETURN FROM fact (RESTORE REGISTERS AND POP FRAME)
	lw	$ra, -4($fp)
	move	$sp, $fp
	lw	$fp, ($sp)	# RESTORE OLD FRAME POINTER
	jr	$ra

# The main program
	.text
	# main MUST BE GLOBAL
	.globl	main	
main:	# ALLOCATE A FRAME FOR THE DYNAMIC LINK, RETURN ADDRESS, STATIC LINK,
	# AND FOR THE INTEGERS i AND res (TOTAL: 5*4 = 20 BYTES)
	sw	$fp, ($sp)	# PUSH OLD FRAME POINTER (DYNAMIC LINK)
	move	$fp, $sp	# FRAME	POINTER NOW POINTS TO THE TOP OF STACK
	subu	$sp, $sp, 20	# ALLOCATE TWENTY BYTES IN THE STACK

	# SAVE RETURN ADDRESS IN FRAME
	sw	$ra, -4($fp)

	# SAVE STATIC LINK IN FRAME
	sw	$v0, -8($fp)
	
loop:	# PRINT prompt
	.data
prompt:	.asciiz	"Number? "
	.text
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	# READ i (i IS LOCATED AT -12($fp))
	li	$v0, 5
	syscall
	sw	$v0, -12($fp)
	
	# IF i<=0 GOTO EXIT
	blez	$v0, exit
	
	# PUSH i
	lw	$a0, -12($fp)
	sw	$a0, ($sp)
	subu	$sp, $sp, 4

	# THE STATIC LINK OF fact IS THE FRAME POINTER OF main
	move	$v0, $fp

	# CALL fact	
	jal	fact

	# STORE THE RESULT OF fact(i) INTO res (res IS LOCATED AT -16($fp))
	sw	$v0, -16($fp)
	
	# PRINT answer
	.data
answer:	.asciiz "The factorial is: "
	.text
	li	$v0, 4
	la	$a0, answer
	syscall
	
	# PRINT res
	li	$v0, 1
	lw	$a0, -16($fp)
	syscall
	
	# PRINT END OF LINE
	.data
endl:	.asciiz "\n"
	.text
	li	$v0, 4
	la	$a0, endl
	syscall

	# LOOP BACK
	b	loop
	
exit:	# RETURN FROM main (RESTORE REGISTERS AND POP FRAME)
	lw	$ra, -4($fp)
	move	$sp, $fp
	lw	$fp, ($sp)	# RESTORE OLD FRAME POINTER
	jr	$ra

