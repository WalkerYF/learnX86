# ʵ��������͵ĺ���
# �ȸ���һ������Ϊ��λ�����飬����������
# ���غͣ��ŵ�$v0
# ע��la��lw������
.data
	#array1: .space  40 # 4*10�����֣���λ��word
	array1: .word 1,2,3,4,5,6,7,8,9,10
	length: .word 10
	result: .word 0
.text
__start:
	la $a0, array1 # ��������1�� ����ͷָ��
	lw $a1, length # ��������2�� ���鳤��
	jal SUM  # ����ŵ�v0
	sw $v0, result
	j EXIT	
SUM:
	move $t0, $zero  # t0Ҫ��������������Ϊ0
	move $t1, $a0 # ��Ϊָ������Ԫ�ص�ָ��
LOOP:	beq $t0, $a1, DONE # ������������볤����ȣ����˳�ѭ��
	lw $t3, ($t1) #  �Ӵ洢���ڶ�ȡָ��ָ�������
	add $v0, $v0, $t3
	add $t1, $t1, 4 # ��ָ��ָ����һ������
	add $t0, $t0, 1 # ������+1
	j LOOP
DONE:	jr $ra
EXIT: