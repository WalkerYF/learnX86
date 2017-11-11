assume cs:code, ss:stack
stack segment
    dw 16 dup (0)
stack ends
code segment
start:  
    mov ax, stack
    mov ss, ax
    mov sp, 32
    mov ax, 4240h
    mov dx, 000fh
    mov cx, 0ah
    call divdw
    mov ax, 4c00h
    int 21h
    
    
    
    
;���ƣ�divdw
;���ܣ����в����������ĳ������㣬������Ϊdword �ͣ�����Ϊword �ͣ����Ϊdword �͡�
;������ 
;(ax)=dword �����ݵĵ�16 λ
;(dx)=dword�����ݵĸ�16λ
;(ex)=����
;���أ� (dx)=����ĸ�16 λ�� (ax)=����ĵ�16 λ   (ex)=����
; ���㷽���ο����й�ʽ
divdw:  
    push bx
    
    mov bx, ax ; bx stores L
    mov ax, dx ; ax stores H
    mov dx, 0
    div cx ; after div, ax holds int(H/N), dx holds rem(H/N)
    push ax ; push int(H/N) temporarily
    mov ax, bx ; ax stores L
    div cx
    mov cx, dx 
    
    pop dx
    pop bx
    ret
code ends
end start