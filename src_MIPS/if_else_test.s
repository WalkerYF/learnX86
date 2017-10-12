# 实现if-else结构
.data
	var1: .word 66
	var2: .word 65
.text
.globl main
main:
	lw $t1, var1   # var = 66
	lw $t2, var2   # var = 65
	beq $t1, $t2, ELSE # 如果两个数相等就跳转
	add $t1, $t1, $t2
	sw $t1, var1
	j EXIT
ELSE:
	sub $t2, $t1, $t1
	sw $t2, var2
EXIT:
	
