assume ds:data, cs:code 

data segment
    db 'welcome to masm!'
data ends  

code segment
start:  
    mov ax, data
    mov ds, ax
    mov ax, 0B800H   ; 初始化 显存区域为段首地址
    mov es, ax
    
    mov bx, 1664
    mov si, 0        ; 离显示区域首地址的偏移量
    mov cx, 16
    char1:  
        mov al, [si]      ; 低8位为显示的数据
        mov ah, 10000010B ; 高八位为显示的格式
        ;mov es:[bx], al
        ;mov es:[bx+1], ah 
        mov es:[bx], ax   ; 该行代码效果与上面两行相等
        add bx, 2         ; 准备写后面的字节，由于一次写两个字节，所以步长为2
        inc si
        loop char1 
        
    mov bx, 1824
    mov si, 0
    mov cx, 16
    char2:  
        mov al, [si]
        mov ah, 10100100B
        mov es:[bx], ax
        add bx, 2
        inc si
        loop char2   
        
    mov bx, 1984
    mov si, 0
    mov cx, 16
    char3:  
        mov al, [si]
        mov ah, 11110001B
        mov es:[bx], ax
        add bx, 2
        inc si
        loop char3  
        
    mov ax, 4C00H
    int 21H
code ends
end start