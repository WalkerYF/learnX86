assume ds:data, cs:code 

data segment
    db 'welcome to masm!'
data ends  

code segment
start:  
    mov ax, data
    mov ds, ax
    mov ax, 0B800H   ; ��ʼ�� �Դ�����Ϊ���׵�ַ
    mov es, ax
    
    mov bx, 1664
    mov si, 0        ; ����ʾ�����׵�ַ��ƫ����
    mov cx, 16
    char1:  
        mov al, [si]      ; ��8λΪ��ʾ������
        mov ah, 10000010B ; �߰�λΪ��ʾ�ĸ�ʽ
        ;mov es:[bx], al
        ;mov es:[bx+1], ah 
        mov es:[bx], ax   ; ���д���Ч���������������
        add bx, 2         ; ׼��д������ֽڣ�����һ��д�����ֽڣ����Բ���Ϊ2
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