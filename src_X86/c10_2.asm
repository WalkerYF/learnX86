assume cs:code  
; ����ƽ����������һ��������

data segment
    dw 1,2,3,4,5,6,7,8
    dd 0,0,0,0,0,0,0,0
data ends
            

code segment             
start:
    mov ax, data
    mov ds, ax
    mov si, 0      ; ָ���һ��word��Ԫ
    mov di, 16     ; ָ��ڶ���dword��Ԫ
              
    mov cx, 8
s:  
    mov bx, [si]   ; ��ȡһ��������������dx��
    call cube      ; ִ���ӹ��̣�
    mov [di], ax
    mov [di+2], dx
    add si, 2
    add di, 4
    loop s 
    
    mov ax, 4c00h
    int 21h
    
    
    ; ���ã���������
    ; ������dx:����������
    ; ���أ�[dx:ax]��������� 
    ; ������dx����������Ҫ��bx ,��Ȼ����һ�κ�dx�ᱻˢ�� 
    ; ���ã���������
    ; ������bx:����������
    ; ���أ�[dx:ax]���������
cube:
    mov ax, bx
    mul bx
    mul bx
    ret
code ends

end start