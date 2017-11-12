assume cs:code
; 将一个中断例程安装到中断向量7ch

code segment
start:
    mov ax, cs
    mov ds, ax  ; 设置数据段指针为代码段
    mov ax, 0
    mov es, ax  ; 设置中断向量表处为es段

    ; 安装代码段，分为4个步骤
    ; 设置si为被复制的代码段的起始位置
    ; 设置di为复制目的地的起始位置
    ; 设置复制长度 （即代码长度）存在cx中
    ; 设置传输方向， 由df控制
    ; 设置完就可以开始复制啦
    mov si, offset sqr
    mov di, 200h
    mov cx, offset sqrend-offset sqr
    cld ; 设置传输方向为正    
    rep movsb

    ; 安装中断向量
    mov ax, 0
    mov es, ax
    mov word ptr es:[7ch*4], 200h ; 偏移地址
    mov word ptr es:[7ch*4+2], 0  ; 段地址

    mov ax, 4c00h
    int 21h

sqr:
    add ax, ax
    iret
sqrend:
    nop

code ends

end start