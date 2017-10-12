.data
	var1:	.word	23		 # 先声明一个 word 型的变量 var1 = 23;
	.text
__start:
	lw	$t0, var1	 # 令寄存器 $t0 = var1 = 23;
	li	$t1, 5		 # 令寄存器 $t1 = 5;
	sw	$t1, var1	# 将var1的值修改为$t1中的值： var1 = $t1 = 5;

