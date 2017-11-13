; 大数相加

data segment
    db 128 dup(0)
    db 128 dup(0)
    db 128 dup(0)    
data ends


code segment

start:
        
    ; add some code here
    
; end start    

; ------------------------------------------------------------------------     
    ; 参数：si:指向第一个操作数中某一个字的指针
    ;       di:指向第二个操作数中某一个字的指针
    ;       cx:操作数字单元数量
    ; 功能 将第一个操作数与第二个操作数相加，结果放在第一个操作数所在内存区域
    ; 前提：x86遵循小端法 
big_add:
    mov ax, [si]
    adc ax, [di]
    mov [si], ax
    inc si
    inc si
    inc di
    inc di   ; inc 不会改变CF位，确保之后的进位仍然准确
    loop big_add
; end big_add    
     
code ends

end start
