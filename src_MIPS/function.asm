# 实现函数，面向过程编程
# subroutine call
# 实现一个算平方的函数
.data
	var1: .word 3
	result: .word 0
.text
__start:
	lw $t1, var1 # var1 = 3
	move $a0, $t1
	jal SQUARE
	sw $v0, result
	j EXIT
SQUARE:
	mul $v0, $a0, $a0
	jr $ra
EXIT:

