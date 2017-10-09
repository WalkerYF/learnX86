# 实现数组求和的函数
# 先给出一个以字为单位的数组，并给出长度
# 返回和，放到$v0
# 注意la与lw的区别
.data
	#array1: .space  40 # 4*10个数字，单位是word
	array1: .word 1,2,3,4,5,6,7,8,9,10
	length: .word 10
	result: .word 0
.text
__start:
	la $a0, array1 # 函数参数1， 数组头指针
	lw $a1, length # 函数参数2， 数组长度
	jal SUM  # 结果放到v0
	sw $v0, result
	j EXIT	
SUM:
	move $t0, $zero  # t0要用来计数，先置为0
	move $t1, $a0 # 作为指向数组元素的指针
LOOP:	beq $t0, $a1, DONE # 如果计数变量与长度相等，就退出循环
	lw $t3, ($t1) #  从存储区内读取指针指向的数字
	add $v0, $v0, $t3
	add $t1, $t1, 4 # 让指针指向下一个数字
	add $t0, $t0, 1 # 计数器+1
	j LOOP
DONE:	jr $ra
EXIT: