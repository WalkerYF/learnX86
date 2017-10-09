	.data
var1:	.word	23		# declare storage for var1; initial value is 23
　　　　　　　　　　　　　　　　　　 # 先声明一个 word 型的变量 var1 = 3;
	.text
__start:
	lw	$t0, var1	# load contents of RAM location into register $t0:  $t0 = var1
　　　　　　　　　　　　　　　　　　 # 令寄存器 $t0 = var1 = 3;
	li	$t1, 5		# $t1 = 5   ("load immediate")
　　　　　　　　　　　　　　　　　　 # 令寄存器 $t1 = 5;
	sw	$t1, var1	# store contents of register $t1 into RAM:  var1 = $t1
　　　　　　　　　　　　　　　　　　 # 将var1的值修改为$t1中的值： var1 = $t1 = 5;
	done
# END OF PROGRAM