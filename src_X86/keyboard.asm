assume cs:code

; 按一次esc，改变一次颜色
stack segment
    db 128 dup(0)
stack ends

data segment
    dw 0,0
data ends

code segment
start:
    mov ax, stack
    mov es, ax
    mov sp, 128

    mov ax, data
    mov ds, ax

    mov ax, 0
    mov es, ax

    ; 保存原有的int 9中断例程
    push es:[9*4]
    pop ds:[0]
    push es:[9*4+2]
    pop ds:[2]

    ; 在中断向量表中设置新的int 9 中断例程的入口地址
    mov word ptr es:[9*4], offset int9
    mov word ptr es:[9*4+2], cs

    ; 显示a-z
    mov ax, 0b800h
    mov es, ax
    mov ah, 'a'
s:
    mov es:[160*12+40*2], ah
    call delay
    inc ah
    cmp ah, 'z'
    jna s

    ; 将中断向量表中int9中断例程的入口恢复为原来的地址
    mov ax, 0
    mov es, ax
    push ds:[0]
    pop es:[9*4]
    push ds:[2]
    pop es:[9*4+2]

    mov ax, 4c00h
    int 21h

delay:
    push ax
    push dx

    ; 32位整数 dx为高16位，ax为低16位
    mov dx, 0009h
    mov ax, 0000h
s1:
    sub ax, 1
    sbb dx, 0  ; 32位双精度整数-1，带借位
    cmp ax, 0  ; 比较低位字节是否与0 相等，如果不相等，就继续
    jne s1
    cmp dx, 0  ; 比较高位字节是否与0 相等，不相等就继续
    jne s1

    pop dx
    pop ax
    ret

;----------------------int 9 例程
int9:
    push ax
    push bx
    push es

    in al, 60h

    ; 模拟原来的int指令，并且调用原来的int9中断例程
    pushf  ; 存好原来的标志位
    pushf  ; 只是为了改变标志位，会被pop出来的
    pop bx
    and bh, 11111100b
    push bx
    popf    ; 用修改后的标志位覆盖原来的标志位
    call dword ptr ds:[0] ; 改变cs:ip并执行bios中的中断例程
    
    cmp al, 1   ; 检测按键是否为esc，若不是直接跳过
    jne int9ret

    mov ax, 0b800h
    mov es, ax
    inc byte ptr es:[160*12+40*2+1]

int9ret:
    pop es
    pop bx
    pop ax
    iret


code ends
end start