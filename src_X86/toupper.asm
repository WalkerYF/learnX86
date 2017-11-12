; multi-segment executable file template.

data segment
    ; add your data here!
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov bx, 0
    mov cx, 4
loop1:
    push cx ; �����ѭ����cxѹ��ջ�д�ã��ڲ�ѭ����Ҫ�޸�cx
    mov cx, 4
    mov si, 0
loop2:       
    mov dx, [bx+si+3]
    and dx, 11011111b
    mov [bx+si+3], dx
    inc si
    loop loop2
    
    add bx, 16
    pop cx ; ��ջ������ԭ����cx���ָ�cx
    loop loop1
    
            
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
