.data
	var1:	.word	23		 # ������һ�� word �͵ı��� var1 = 23;
	.text
__start:
	lw	$t0, var1	 # ��Ĵ��� $t0 = var1 = 23;
	li	$t1, 5		 # ��Ĵ��� $t1 = 5;
	sw	$t1, var1	# ��var1��ֵ�޸�Ϊ$t1�е�ֵ�� var1 = $t1 = 5;

