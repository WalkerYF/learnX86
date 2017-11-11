assume cs:code  
; 计算平方，放入下一段数据中

data segment
    dw 1,2,3,4,5,6,7,8
    dd 0,0,0,0,0,0,0,0
data ends
            

code segment             
start:
    mov ax, data
    mov ds, ax
    mov si, 0      ; 指向第一组word单元
    mov di, 16     ; 指向第二组dword单元
              
    mov cx, 8
s:  
    mov bx, [si]   ; 读取一个待立方的数到dx中
    call cube      ; 执行子过程，
    mov [di], ax
    mov [di+2], dx
    add si, 2
    add di, 4
    loop s 
    
    mov ax, 4c00h
    int 21h
    
    
    ; 作用：计算立方
    ; 参数：dx:被立方的数
    ; 返回：[dx:ax]立方后的数 
    ; 不能拿dx做操作数，要拿bx ,不然计算一次后dx会被刷掉 
    ; 作用：计算立方
    ; 参数：bx:被立方的数
    ; 返回：[dx:ax]立方后的数
cube:
    mov ax, bx
    mul bx
    mul bx
    ret
code ends

end start