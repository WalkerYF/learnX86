##################################################
#                                                #
#        purpose:to swap two values              #
#                                                #
###############  text segment ####################

.text
.globl main
main:    
   la   $t0,  number    # ��ȡ�����������׵�ַ����$t0
   lw   $t1,  0($t0)    # ��0-3�ֽ����ݴ���$t1
   lw   $t2,  4($t0)    # ��4-7�ֽ����ݴ���$t2

   li   $v0,  4         # ����ַ���msg1
   la   $a0,  msg1
   syscall

   li   $v0,  1         # 1�� ���ܵ��ã������������
   move $a0,  $t1       # 
   syscall

   li   $v0,  4         # ��ӡmsg2
   la   $a0,  msg2
   syscall

   li   $v0,  1         # 1�� ���ܵ��ã������������
   move $a0,  $t2
   syscall

   move $t3,  $t1       # ����$t1��$t2
   move $t1,  $t2       #
   move $t2,  $t3       #

   li   $v0,  4         # ����ַ���msg3
   la   $a0,  msg3
   syscall

   li   $v0,  1         # ����������ݣ���������������  
   move $a0,  $t1
   syscall

   li   $v0,  4         # ����ַ���
   la   $a0,  msg4      # ���з� \n
   syscall

   li   $v0,  1         # ����������ݣ���������������
   move $a0,  $t2
   syscall

   li $v0, 10           # �˳�
   syscall


########### data segment  ##############
.data
   number:  .word 12,34
   msg1:    .asciiz  "the first number is:"
   msg2:    .asciiz  "\nthe second number is:"
   msg3:    .asciiz  "\nnow they are swapped as:\n"
   msg4:    .ascii   "\n"

## end of file


