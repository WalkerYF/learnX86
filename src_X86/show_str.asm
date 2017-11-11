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


; 功能：在指定的位置，用指定的颜色，显式一个用0结束的字符串
; 参数说明：
;    (dh)= 行号（0-24）
;    (dl)= 列好（0-79）
;    (cl)= 颜色
;    (ds:si) = 字符串的首地址
; 返回：无
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
    mul dh   ; 计算行号带来的偏移量
    add bx, ax   ; 将行号带来的偏移量加到bx中
    mov al, 2
    mul dl   ; 计算列号带来的偏移量
    add bx, ax ;bx stores address of start character
    mov al, cl ;al stores the color of character
char:   
    mov ch, 0
    mov cl, ds:[si]   ; 低位存储具体字母
    jcxz zero
    mov ch, al        ; 每个字节，高位存储颜色信息
    mov es:[bx+di], cx; 将两个字母都存到显存段中
    add di, 2         ; 显存段的指针+2
    inc si            ; 数据段的指针+1
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