assume cs:code, ss:stack
stack segment
    dw 16 dup (0)
stack ends

data segment
    db 10 dup (0)
data ends
code segment
start:  
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax
    mov sp, 32
    mov ax, 12666
    mov si, 0
    call dtoc
    mov dh, 8
    mov dl, 3
    mov cl, 2
    call show_str
    mov ax, 4c00h
    int 21h
; 参数：ax：word数据
;    ds:si  指向字符串的首地址
dtoc:   
    push ax
    push si
    push di
    push dx
    push bx
    push cx
    
    mov di, 0     ; 在除的过程记录除的次数，作为数据长度
    mov dx, 0
    mov bx, 10    
    devide: 
        mov cx, ax
        jcxz stop
        div bx    ; (dx,ax) / bx  = ax ----dx
        inc di
        push dx
        mov dx, 0 ; 重要，这个寄存器需要清零
        jmp devide
    stop:   
        mov cx, di
        ; 需要初始化下面过程所用到的寄存器，si在用户输入后没有变过，所以不用初始化
    string: 
        pop bx
        add bx, 30h        ; 将一个数组转成字母
        mov [si], bl       ; 将一个字母存进存储区
        inc si             ; 并将指针+1
        loop string
    pop cx
    pop bx
    pop dx
    pop di
    pop si
    pop ax
    ret
    
show_str:
    push cx
    push bx
    push ax
    push si
    push di
    push es
    ;using cx, bx, ax, si, di, es
    mov ax, 0b800h
    mov es, ax
    mov bx, 0
    mov di, 0
    mov al, 160
    mul dh
    add bx, ax
    mov al, 2
    mul dl
    add bx, ax ;bx stores address of start character
    mov al, cl ;al stores the color of character
    char:   
        mov ch, 0
        mov cl, ds:[si]
        jcxz zero
        mov ch, al
        mov es:[bx+di], cx
        add di, 2
        inc si
        jmp char
    zero:   
        pop es
        pop di
        pop si
        pop ax
        pop bx
        pop cx
        ret
    
code ends
end start