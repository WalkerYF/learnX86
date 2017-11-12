assume cs:code  
code segment  
;为了看到效果，我们最后做清屏  
start:  
    mov ah,1  
    mov al,1  
    int 7ch  
    call delay  
    mov ah,2  
    mov al,2  
    int 7ch  
    call delay  
    mov ah,3  
    int 7ch  
    call delay  
    mov ah,0  
    int 7ch  
      
    mov ax,4c00h  
    int 21h  
  
delay:  
    push ax  
    push dx  
    mov dx, 0001h  
    mov ax, 1111h  
    s1:  
    sub ax,1  
    sbb dx,0  
    cmp ax,0  
    jne s1  
    cmp dx,0  
    jne s1  
    pop dx  
    pop ax  
    ret  
  
code ends  
end start 