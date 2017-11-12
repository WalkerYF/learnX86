assume cs:code
; 显示月份
code segment
start:
    ; 8单元是存储月份信息的
    mov al, 8
    out 70h, al ; 向70h端口发送地址
    in al, 71h  ; 从71h端口读取数据

    ; ah, al
    ; 将月份的十位存到ah
    ; 将月份的各位存到al
    ; BCD码转数字字母
    mov ah, al
    mov cl, 4
    shr ah, cl
    and al, 00001111b
    ; 数字变字母
    add ah, 30h
    add al, 30h
    ; 输出
    mov bx, 0b800h
    mov es, bx
    mov byte ptr es:[160*12+40*2], ah
    mov byte ptr es:[160*12+40*2+2], al

    mov ax, 4c00h
    int 21h

code ends

end start
    