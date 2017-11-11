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
; ������ax��word����
;    ds:si  ָ���ַ������׵�ַ
dtoc:   
    push ax
    push si
    push di
    push dx
    push bx
    push cx
    
    mov di, 0     ; �ڳ��Ĺ��̼�¼���Ĵ�������Ϊ���ݳ���
    mov dx, 0
    mov bx, 10    
    devide: 
        mov cx, ax
        jcxz stop
        div bx    ; (dx,ax) / bx  = ax ----dx
        inc di
        push dx
        mov dx, 0 ; ��Ҫ������Ĵ�����Ҫ����
        jmp devide
    stop:   
        mov cx, di
        ; ��Ҫ��ʼ������������õ��ļĴ�����si���û������û�б�������Բ��ó�ʼ��
    string: 
        pop bx
        add bx, 30h        ; ��һ������ת����ĸ
        mov [si], bl       ; ��һ����ĸ����洢��
        inc si             ; ����ָ��+1
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