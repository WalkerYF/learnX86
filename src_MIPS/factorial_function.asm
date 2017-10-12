# 第一个递归程序
# 计算阶乘n!
# 函数结果返回到$v0
.data
	var1: .word 5
	result: .word 0
.text
__start:
	lw $a0, var1
	jal FACT
	sw $v0, result
	j EXIT
FACT:
	addi $sp, $sp, -8 # 使用两个字的栈空间去存参数以及返回地址
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	slti $t0, $a0, 1
	beq $t0, $zero, L1 #如果$to>=1 就跳去调用fact（n-1）
	addi $v0, $zero, 1 # 如果$t0< 1, 就赋值为1，返回
	addi $sp, $sp, 8 # 叶子过程不用保存数据， 反正也没有子过程去覆盖
	jr $ra
L1:	addi $a0, $a0, -1
	jal FACT # 调用fact（n-1）
	
	lw $a0, 0($sp) # 回复之前存下的参数和返回地址
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	mul $v0, $a0, $v0
	jr $ra
EXIT:
