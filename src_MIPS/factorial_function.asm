# ��һ���ݹ����
# ����׳�n!
# ����������ص�$v0
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
	addi $sp, $sp, -8 # ʹ�������ֵ�ջ�ռ�ȥ������Լ����ص�ַ
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	slti $t0, $a0, 1
	beq $t0, $zero, L1 #���$to>=1 ����ȥ����fact��n-1��
	addi $v0, $zero, 1 # ���$t0< 1, �͸�ֵΪ1������
	addi $sp, $sp, 8 # Ҷ�ӹ��̲��ñ������ݣ� ����Ҳû���ӹ���ȥ����
	jr $ra
L1:	addi $a0, $a0, -1
	jal FACT # ����fact��n-1��
	
	lw $a0, 0($sp) # �ظ�֮ǰ���µĲ����ͷ��ص�ַ
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	mul $v0, $a0, $v0
	jr $ra
EXIT:
