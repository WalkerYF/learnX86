assume cs:code

data segment
    db 'welcome to masm!',0
data ends                  



  
code segment

start:
     mov dh, 8
     mov dl, 3
     mov cl, 2
     mov ax, data
     mov ds, ax
     mov si, 0
     call show_str
     
     mov ax, 4c00h
     int 21h

; end start


; ���ܣ���ָ����λ�ã���ָ������ɫ����ʽһ����0�������ַ���
; ����˵����
;    (dh)= �кţ�0-24��
;    (dl)= �кã�0-79��
;    (cl)= ��ɫ
;    (ds:si) = �ַ������׵�ַ
; ���أ���
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
    mul dh   ; �����кŴ�����ƫ����
    add bx, ax   ; ���кŴ�����ƫ�����ӵ�bx��
    mov al, 2
    mul dl   ; �����кŴ�����ƫ����
    add bx, ax ;bx stores address of start character
    mov al, cl ;al stores the color of character
char:   
    mov ch, 0
    mov cl, ds:[si]   ; ��λ�洢������ĸ
    jcxz zero
    mov ch, al        ; ÿ���ֽڣ���λ�洢��ɫ��Ϣ
    mov es:[bx+di], cx; ��������ĸ���浽�Դ����
    add di, 2         ; �Դ�ε�ָ��+2
    inc si            ; ���ݶε�ָ��+1
    jmp char
zero:   
    pop es
    pop di
    pop si
    pop ax
    pop bx
    pop cx
    ret      
  
; end shor_str    
    
code ends

end start