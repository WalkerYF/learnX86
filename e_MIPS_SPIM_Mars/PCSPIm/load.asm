.text # 代码段
.globl main # 程序从此开始
main: # 主程序
lw $t0,memdata # 从存储器中读取一个字的数据到寄存器中，整32位， WORD
lh $t1,memdata # 从存储器中读取半个字的数据到寄存器中，半字符号扩展 ，HALFWORD
lb $t2,memdata # 从存储器中读取一个字节的数据到寄存器中，字节符号扩展， BYTE
lhu $t3,memdata # 从存储器中读取半个字的数据到寄存器中，无符号半字扩展， HALFWORD
lbu $t4,memdata # 从存储器中读取一个字节的数据到寄存器中，无符号字节扩展， BYTE
lb $s4,memdata+1 #（取memdata第二个单元数据）从存储器中读取一
# 个字节的数据到寄存器中，字节符号扩展 BYTE
li $v0, 10 # 退出
syscall # 系统调用
.data # 数据段
memdata: # 变量名称
.word 0xabcde080 # 数据定义-字（32位）