###################################################
#
# �Ӽ�������������������������֮�ͣ����ҳ������
#
###########################################################
.text
.globl main

main:
   la $t0, array        # �����׵�ַ
   li $v0, 4            # ����ַ���
   la $a0, msg1         # �����Ϣmsg1
   syscall

   li $v0, 5            # ���ռ�������һ�����������浽$v0
   syscall
   sw $v0,0($t0)        # �����������һ�����ݱ��浽������

   li $v0, 5
   syscall
   sw $v0,4($t0)        # ����������ڶ������ݱ��浽������

   li $v0, 5
   syscall
   sw $v0,8($t0)        # ������������������ݱ��浽������

   lw $s0, ($t0)        # �������ж�ȡ��һ�������浽$s0�Ĵ�����
   lw $s1, 4($t0)       # �������ж�ȡ�ڶ��������浽$s0�Ĵ�����
   lw $s2, 8($t0)       # �������ж�ȡ�����������浽$s0�Ĵ�����

   add $s3, $s0, $s1    # 
   add $s4, $s2, $s3    # ����֮�ͱ��浽$s4

   li $v0, 4            # 
   la $a0, msg3         # �����Ϣmsg3
   syscall

   li $v0, 1            # �������
   move $a0, $s4        # ����֮��
   syscall

   li $v0, 4            # ����
   la $a0, newline
   syscall

   blt $s0, $s1,num2    # if $s0<$s1, ת num2
   move $s3, $s0        # 

   j num3               # if $s0>=$s1, ת num3
num2:
   move $s3, $s1        # if $s1>=$s0,$s3<-$s1

num3:
   bge $s3, $s2, num4   # if $3>=$s2, $s3�����������ת num4
   move $s3, $s2        # ����$s2������������浽$s3

num4:    # ��������
   li $v0, 4            # ����ַ���
   la $a0, msg2         # �����Ϣmsg2
   syscall

   li $v0, 1            # �������
   move $a0, $s3        # ��������
   syscall

   li $v0, 4            # ����ַ���
   la $a0, newline      # ����
   syscall

   li $v0, 10           # �˳�
   syscall               

.data
   array:       .space     12  # ����12���ֽڿռ䣨�������������
   msg1:        .asciiz    "input the 3 integers(each num end of [enter]): \n"
   msg2:        .asciiz    "the max num is: "
   msg3:        .asciiz    "the tatal is: "
   newline:     .asciiz    "\n"     # ���з�
