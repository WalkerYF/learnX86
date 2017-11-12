assume cs:code, ss:stack
stack segment
    dw 16 dup (0)
stack ends
code segment
start:  
    mov ax, stack
    mov ss, ax
    mov sp, 32
    mov ax, 4240h
    mov dx, 000fh
    mov cx, 0ah
    call divdw
    mov ax, 4c00h
    int 21h
    
    
    
    
;名称：divdw
;功能：进行不会产生溢出的除法运算，被除数为dword 型，除数为word 型，结果为dword 型。
;参数： 
;(ax)=dword 型数据的低16 位
;(dx)=dword型数据的高16位
;(ex)=除数
;返回： (dx)=结果的高16 位， (ax)=结果的低16 位   (ex)=余数
; 计算方法参考书中公式
divdw:  
    push bx
    
    mov bx, ax ; bx stores L
    mov ax, dx ; ax stores H
    mov dx, 0
    div cx ; after div, ax holds int(H/N), dx holds rem(H/N)
    push ax ; push int(H/N) temporarily
    mov ax, bx ; ax stores L
    div cx
    mov cx, dx 
    
    pop dx
    pop bx
    ret
code ends
end start