; �������

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
    ; ������si:ָ���һ����������ĳһ���ֵ�ָ��
    ;       di:ָ��ڶ�����������ĳһ���ֵ�ָ��
    ;       cx:�������ֵ�Ԫ����
    ; ���� ����һ����������ڶ�����������ӣ�������ڵ�һ�������������ڴ�����
    ; ǰ�᣺x86��ѭС�˷� 
big_add:
    mov ax, [si]
    adc ax, [di]
    mov [si], ax
    inc si
    inc si
    inc di
    inc di   ; inc ����ı�CFλ��ȷ��֮��Ľ�λ��Ȼ׼ȷ
    loop big_add
; end big_add    
     
code ends

end start
