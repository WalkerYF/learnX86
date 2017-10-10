# MIPS 学习笔记

补充说明：只会放一些不容易记住的东西,做备忘

https://www.cnblogs.com/thoupin/p/4018455.html

## MIPS寄存器体系

| ;REGISTER | NAME      | USAGE                                    |
| --------- | --------- | ---------------------------------------- |
| \$0       | \$zero    | 常量0(constantvalue 0)永远返回值为0              |
| \$1       | \$at      | (assembler temporary) reserved by the assembler 汇编保留寄存器（不可做其他用途） |
| \$2-\$3   | \$v0-\$v1 | 子函数调用返回值(values for results and expressionevaluation) |
| \$4-\$7   | \$a0-\$a3 | 子函数调用参数(arguments)                       |
| \$8-\$15  | \$t0-\$t7 | 暂时的(或随便用的)                               |
| \$16-\$23 | \$s0-\$s7 | 保存的(或如果用，需要SAVE/RESTORE的)(saved)子函数寄存器变量。在函数返回之前子函数必须保存和恢复使用过的变量，从而调用函数知道这些寄存器的值没有变化。 |
| \$24-\$25 | \$t8-\$t9 | 暂时的(或随便用的)                               |
| \$26-\$27 | \$k0-\$k1 | 通常被中断或异常处理程序使用作为保存一些系统参数                 |
| \$28      | \$gp      | 全局指针(GlobalPointer) 一些运行系统维护这个指针来更方便的存取"static"和"extern" 变量。 |
| \$29      | \$sp      | 堆栈指针(StackPointer)                       |
| \$30      | \$fp      | 帧指针(FramePointer) 第9个寄存器变量。子函数可以用来做桢指针   |
| \$31      | \$ra      | 子函数的返回地址(returnaddress)                  |



## 程序结构

- 本质其实就只是数据声明+普通文本+程序编码（文件后缀为.s，或者.asm也行）
- 数据声明在代码段之后（其实在其之前也没啥问题，也更符合高级程序设计的习惯）

### Data Declarations
### 数据声明

- 数据段以 **  .data ** 为开始标志
- 声明变量后，即在主存中分配空间。

> format for declarations:
>
> 声明的格式：
> ```
> name:	                storage_type	value(s)	
> 变量名：（冒号别少了）     数据类型         变量值     
> ```

> ```
> example
> 	
> var1:		.word	3	
> 				# create a single integer variable with initial value 3
> 				# 声明一个 word 类型的变量 var1, 同时给其赋值为 3
> array1:		.byte	'a','b'	
> 				# create a 2-element character array with elements initialized
> 				#   to  a  and  b
> 　　　　　　　　　# 声明一个存储2个字符的数组 array1，并赋值 'a', 'b'
> array2:		.space	40	
> 				# allocate 40 consecutive bytes, with storage uninitialized
> 				#   could be used as a 40-element character array, or a
> 				#   10-element integer array; a comment should indicate which!	
> 　　　　　　　　　# 为变量 array2 分配 40字节（bytes)未使用的连续空间，当然，对于这个变量
> 　　　　　　　　　# 到底要存放什么类型的值， 最好事先声明注释下！
> ```



### Code

### 代码

- 代码段以 **  .text ** 为开始标志
- 其实就是各项指令操作
- 程序入口为**main：**标志（这个都一样啦）
- 程序结束标志（详见下文）

### Comments
### 注释

- 使用#






## 子过程调用

同样，在过程运行中，程序必须遵循以下6 个步骤：

- 将参数放在过程可以访问的位置。


- 将控制转交给过程。
- 获得过程所需的存储资源。
- 执行需要的任务。
- 将结果的值放在调用程序可以访问的位置。
- 将控制返回初始点，因为一个过程可能由一个程序中的多个点调用。

### 一些约定

• \$a0 - \$a3: 用于传递参数的4 个参数寄存器。
• \$v0 - \$vl: 用于返回值的两个值寄存器。
• \$ra : 用于返回起始点的返回地址寄存器。

### 一些特殊的跳转指令

跳转和链接指令:

​	跳转到某个地址的同时将下一条指令的地址保存到寄存器$ra 中的
指令。

`jal ProcedureAddress`

寄存器跳转指令:

​	表示无条件跳转到寄存器所指定的地址：
`jr $ra`



