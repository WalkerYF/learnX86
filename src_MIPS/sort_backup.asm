# 排序
# 排序sort函数，$a0 为数组首地址 $a1为数组元素个数
# 使用冒泡排序算法

.data
	array1: .word 4,2,3,6,7,1,5,23,12,34
	length: .word 10
.globl main
.text
 main:
 	lw $a1, length
	la $a0, array1
	jal sort

	la $s0, array1  # 将数组地址存起来
	lw $s1, length   # 将数组长度记下来
	move $t0, $s1 # $t0 使用数组长度初始化循环计数器变量
print: 
	beq $t0, $zero, print_end
	# 将当前地址的数字输出出来
	lw  $a0, ($s0)
	li $v0, 1
	syscall
	# 输出一个空格
	li $a0, 32
	li $v0, 11
	syscall
	addi $s0, $s0, 4 # 地址+4，准备输出下一个数
	addi $t0, $t0, -1 # 计数器-1
	j print
print_end:	
	j EXIT
 sort:
 	# v $a0
 	# n $a1
 	# i $s0
 	# j $s1
 	addi $sp, $sp, -20
 	sw $ra, 16($sp)
 	sw $s3, 12($sp)
 	sw $s2, 8($sp)
 	sw $s1, 4($sp)
 	sw $s0, 0($sp)
 	# 保存寄存器值
 	move $s2, $a0
 	move $s3, $a1
 	# 移动参数位置，腾出$a0, $a1两个寄存器
 	# ------------------第一层循环--------------------------------- 	
 	move $s0, $zero # 初始化循环变量i = 0
 forltst:
 	# 判断循环是否退出
 	slt $t0, $s0, $s3 # 如果i < n ,则将$t0置为1
 	beq $t0, $zero, exit1 # 如果 i >= n， 循环结束
 	# ------------------以上是第一层循环---------------
 	addi $s1, $s0, -1 # 循环变量j的初始化 j = i-1
 for2tst:
 	# 循环退出第一个判断条件
 	slti $t0, $s1, 0
 	bne $t0, $zero, exit2
	# 循环退出第二个判断条件 	
 	sll $t1, $s1, 2 # 得到 $t1 = 4 * j
 	add $t2, $s2, $t1 # $t2 = v[j]的地址
 	lw $t3, 0($t2) # 得到v[j] 的值
 	lw $t4, 4($t2) # 得到v[j+1]的值
 	
 	slt $t0, $t4, $t3 # 如果$t3 < $t4, $t0 = 1
 	beq $t0, $zero, exit2 # if $t3 >= $t4, exit2
 	# ----------循环体----------
 	move $a0, $s2
 	move $a1, $s1
 	# 传递参数
 	jal swap
 	# ---------循环体结束-------
 	addi $s1, $s1, -1 # 循环变量j--
 	j for2tst # continue loop
 exit2:
 	# ------------------以下是第一层循环----------
 	add $s0, $s0, 1 # i++
 	j forltst
 exit1:
 	lw $s0, 0($sp)
 	lw $s1, 4($sp)
 	lw $s2, 8($sp)
 	lw $s3, 12($sp)
 	lw $ra, 16($sp)
 	addi $sp, $sp, 20
 	# 恢复寄存器的值
 	# restore the reg
 	jr $ra
swap:
	sll $t1, $a1, 2
	add $t1, $a0, $t1 # v[k]的地址
	
	lw $t0, 0($t1) # 得到v[k]的值
	lw $t2, 4($t1) # 得到v[k+1]的值
	
	sw $t2, 0($t1) # 将v[k+1]的值写回v[k]
	sw $t0, 4($t1)
	jr $ra
EXIT:
