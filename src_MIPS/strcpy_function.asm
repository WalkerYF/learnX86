# 复制字符串

.data
	var: .byte '1','2','3','a','b'
	#var2: .byte '1','2','3','b','a'
	result : .space 100 # 以字节形式存储字符串
.text
__start:
	la $a0 , var
	la $a1 , result
	jal strcpy
	sw $v0, result
	j EXIT
strcpy:
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	add $s0, $zero, $zero # 将s0清零  i
L1:	add $t1, $s0, $a1  # $t1 y[i]
	lbu $t2, 0($t1)
	add $t3, $s0, $a0
	sb $t2, 0($t3)
	beq $t2, $zero, L2
	add $s0, $s0, 1
	j L1
L2:	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra
EXIT: