# ����
# ����sort������$a0 Ϊ�����׵�ַ $a1Ϊ����Ԫ�ظ���
# ʹ��ð�������㷨

.data
	array1: .word 4,2,3,6,7,1,5,23,12,34
	length: .word 10
.globl main
.text
 main:
 	la $a0, array1
 	lw $a1, length
	jal sort
	# �������׵�ַ�����鳤�ȴ�����
	la $s0, array1  # �����׵�ַ
	lw $s1, length   # ���鳤��
	move $t0, $s1 # $t0, ѭ������������ʼ��Ϊ����
print: 
	beq $t0, $zero, print_end
	# �������
	lw  $a0, ($s0)
	li $v0, 1
	syscall
	# ����ո�
	li $a0, 20
	li $v0, 11
	syscall
	addi $s0, $s0, 4 # ��ַ��4��׼�������һ������
	addi $t0, $t0, -1 # ������-1
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
 	# ����Ĵ���ֵ
 	move $s2, $a0
 	move $s3, $a1
 	# �ƶ�����λ�ã��ڳ�$a0, $a1�����Ĵ���
 	# ------------------��һ��ѭ��--------------------------------- 	
 	move $s0, $zero # ��ʼ��ѭ������i = 0
 forltst:
 	# �ж�ѭ���Ƿ��˳�
 	slt $t0, $s0, $s3 # ���i < n ,��$t0��Ϊ1
 	beq $t0, $zero, exit1 # ��� i >= n�� ѭ������
 	# ------------------�����ǵ�һ��ѭ��---------------
 	addi $s1, $s0, -1 # ѭ������j�ĳ�ʼ�� j = i-1
 for2tst:
 	# ѭ���˳���һ���ж�����
 	slti $t0, $s1, 0
 	bne $t0, $zero, exit2
	# ѭ���˳��ڶ����ж����� 	
 	sll $t1, $s1, 2 # �õ� $t1 = 4 * j
 	add $t2, $s2, $t1 # $t2 = v[j]�ĵ�ַ
 	lw $t3, 0($t2) # �õ�v[j] ��ֵ
 	lw $t4, 4($t2) # �õ�v[j+1]��ֵ
 	
 	slt $t0, $t4, $t3 # ���$t3 < $t4, $t0 = 1
 	beq $t0, $zero, exit2 # if $t3 >= $t4, exit2
 	# ----------ѭ����----------
 	move $a0, $s2
 	move $a1, $s1
 	# ���ݲ���
 	jal swap
 	# ---------ѭ�������-------
 	addi $s1, $s1, -1 # ѭ������j--
 	j for2tst # continue loop
 exit2:
 	# ------------------�����ǵ�һ��ѭ��----------
 	add $s0, $s0, 1 # i++
 	j forltst
 exit1:
 	lw $s0, 0($sp)
 	lw $s1, 4($sp)
 	lw $s2, 8($sp)
 	lw $s3, 12($sp)
 	lw $ra, 16($sp)
 	addi $sp, $sp, 20
 	# �ָ��Ĵ�����ֵ
 	# restore the reg
 	jr $ra
swap:
	sll $t1, $a1, 2
	add $t1, $a0, $t1 # v[k]�ĵ�ַ
	
	lw $t0, 0($t1) # �õ�v[k]��ֵ
	lw $t2, 4($t1) # �õ�v[k+1]��ֵ
	
	sw $t2, 0($t1) # ��v[k+1]��ֵд��v[k]
	sw $t0, 4($t1)
	jr $ra
EXIT:
