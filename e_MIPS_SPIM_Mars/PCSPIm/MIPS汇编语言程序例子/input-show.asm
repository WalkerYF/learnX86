############################################
#
# ����һ������---��ʾ������һ���ַ�---��ʾ
#
#############################################

.data
    str:    .space 40                       # ����40���ֽڿռ�
   msg1:    .asciiz  "\ninput a integer: "  # 
   msg2:    .asciiz  "\ninput a string: "   # 
   msg3:    .asciiz  "\nyou input: "        # 

.text
.globl main

main:              

   # ���� integer
   li     $v0, 4                  # ��ʾ��Ϣ msg1
   la     $a0, msg1               
   syscall

   li     $v0, 5                  # ���ռ�������������������浽$v0
   syscall                        # 
   move   $a1, $v0                # �����յ�������ת�棬$a1<-$v0                     

   li     $v0, 4                  # ��ʾ msg3
   la     $a0, msg3
   syscall

   li     $v0, 1                  # ��ʾ ���������
   move   $a0, $a1                # ��ʾ�������뱣�浽$a0
   syscall

   li     $v0, 4                  # ��ʾ��Ϣ msg2
   la     $a0, msg2
   syscall

   # �����ַ��� string
   li     $v0, 8                  # ���ռ��������ַ���
   la     $a0, str                # $a0<-�ַ����׵�ַ(�ַ����������׵�ַ��
   li     $a1, 40                 # ������ַ������ȱ��浽$a1
   syscall

   li     $v0, 4                  # ��ʾ������ַ��� msg
   la     $a0, str
   syscall

   li     $v0, 10                 # �˳�
   syscall                        # ϵͳ����
