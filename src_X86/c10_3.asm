assume cs:code
; 把所有字母变成大写
data segment
    db 'abcdefg',0
    dw 7
data ends

code segment

start:
    mov ax,data
    mov ds,ax
    
    mov si,0   ; 传递参数，字母数组地址
    mov cx,7   ; 传递参数 7个字母
    
    call capital_i2
    
    mov ax,4c00h
    int 21h 
    
    ; 字符串首地址：si
    ; 字符串长度：cx
capital:
    and [si], 11011111b
    inc si
    loop capital
    ret
    
    ; 改进版，将一个全是字母，以0为结尾的字符窜，转化为大写
    ; 字符串首地址：si
    ; cx：用于检测当前字节是否为零
capital_i:
    mov cl, [si]
    mov ch, 0                   
    jcxz ok
    and [si], 11011111b
    inc si
    jmp short capital_i
ok:
    ret
    
    
    ; 解决寄存器冲突
    ; 编写子程序的时候不必关心调用者使用了那些寄存器
    ; 编写调用子程序的程序不必关心子程序到底使用了哪些寄存器
    ; 将寄存器中的内容都保存起来，在返回前恢复
    ; 改进版2，将一个全是字母，以0为结尾的字符窜，转化为大写
    ; 字符串首地址：si
    ; cx：用于检测当前字节是否为零
capital_i2:
    push cx
    push si
change:
    mov cl, [si]
    mov ch, 0
    jcxz ok_i2
    and byte ptr [si], 11011111b
    inc si
    jmp short change
ok_i2: 
    pop si
    pop cx
    ret
    
    
code ends
       
       
end start