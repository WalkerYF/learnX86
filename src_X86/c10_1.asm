; multi-segment executable file template.

; �о�retָ���ԭ��  
; �о�retfָ���ԭ��
stack segment
    db   16  dup(0)
ends

code segment   
    mov ax, 4c00h ; exit to operating system.
    int 21h    
start:
; set segment registers:
    mov ax, stack
    mov ss, ax
    mov sp, 8
    
    mov ax, 0
    
    push ax
    ret

    ; add your code here
            


ends

end start ; set entry point and stop the assembler.
