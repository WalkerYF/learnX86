assume ds:data, es:table, cs:code

data segment
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'
    ;以上是表示21 年的21 个字符串  ds:[bx+si+0]
    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000, 5937000
    ;以上是表示21 年公司总收入的21个dword 型数据 ds:[bx*4+si+84]  4 bytes
    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800
    ;以上是表示21年公司雇员人数的21个word 型数据  ds:[bx*2 + si + 168(84+84)]
data ends

table segment
    db 21 dup ( 'year summ ne ?? ') ; 16 bytes
    ; es:[bp+0+di]   es:[bp+5+di]  es:[bp+10+di]  es:[bp+13+di]
table ends

stack segment
    dw 8 dup(0)
stack ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov ax, table
    mov es, ax
    mov ax, stack
    mov ss, ax

; 一次迭代，读取一个年份，完成迭代后读取完所有年份并且存到table段的相应位置
    mov cx, 21
    mov si, 0 ; 读该字母的位置
    mov bx, 0 ; 写字符串首地址
    mov di, 0 ; 写 该字母在该字符串中的位置
year:  
    push cx
    mov cx, 4 ; 循环四次，读代表年份的四个数字（字母）
    mov di, 0
    char:  ; 一次迭代，读取一个字母，完成后读取完四个字母，切换到下一行
        mov al, ds:[si] ; 取一个字母
        mov es:[bx+di], al ; 将这个字母存到对应的位置
        inc di
        inc si
        loop char 
    add bx, 16
    pop cx
    loop year
; 一次迭代，读取一个人的收入，并且放入table的对应行的对应位置
; 迭代结束后读取完所有人的收入
    mov cx, 21
    mov bx, 0 ; 指示读数据的位置相对于收入段首的偏移量
    mov di, 0 ; 指示写数据的位置
salary：
    mov dx, ds:[si+84]
    mov es:[bx+5], dx
    add si, 2
    mov dx, ds:[si+84]
    mov es:[bx+7], dx 
    add si, 2
    add bx, 16 
    loop salary

    mov cx, 21
    mov bx, 0
    mov si, 0
staff:
    mov dx, ds:[bx+168]
    mov es:[si+10], dx
    add bx, 2
    add si, 16
    loop staff


    mov cx, 21
    mov bx, 0
average:
    mov dx, es:[bx+5]
    mov ax, es:[bx+7]
    div word ptr es:[bx+10]
    mov es:[bx+13], ax
    add bx, 16
    loop cx

code ends

end start