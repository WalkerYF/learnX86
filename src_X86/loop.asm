; multi-segment executable file template.
; in book experiment  4



code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax

    mov bx, 0
    mov cx, 64
    
  s:mov ds:[bx], bx
    inc bx
    loop s
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
