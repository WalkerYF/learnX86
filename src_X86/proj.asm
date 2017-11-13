; 我要写什么项目呢？
assume cs:code,ss:stack,ds:data
data segment
    plane_pos dw 0,0
    enemy_pos dw 0,0
    message_score db 'score:','$'
    message_life db 'your life:','$'
data ends


stack segment
    db 128 dup(0)
stack ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax

    mov ah, 00h  ; 设置显示方式为320*200彩色图形方式,一个一个像素点描
    mov al, 04h
    int 10h

    ; 显示分数
    mov ah,02h;改变光标位置
    mov bh,0
    mov dh,0
    mov dl,0
    int 10
    mov dx,offset message_score; 显示分数信息
    mov ah, 09h
    int 21h

    ; 显示生命值
    mov ah,02h;改变光标位置
    mov bh,0
    mov dh,10
    mov dl,0
    int 10
    mov dx,offset message_life; 显示生命信息
    mov ah, 09h
    int 21h

    mov bx, 150
    mov bp, 180
    mov [plane_pos], bx
    mov [plane_pos+2], bp

plane_loop:
    call play_plane
    jmp check_keyboard

plane_loop2:
    call move_plane

check_keyboard:
    mov ah, 01h 
    int 16h
    ; 如果没有按， zf为0
    ; 如果有按，往下执行
    jz check_keyboard

    ; 从键盘读入字符
    mov ah, 00h
    int 16h

    ; 判断字符
    cmp al, 'w'
    je up
    cmp al, 's'
    je down
    cmp al, 'a'
    je left
    cmp al, 'd'
    je right
    cmp al, 't'
    je shoot
    cmp al, 'q'
    je quit
    jmp check_keyboard

up: 
    mov di, 1
    jmp plane_loop2
down:
    mov di, 2
    jmp plane_loop2
left:
    mov di, 3
    jmp plane_loop2
right:
    mov di, 4
    jmp plane_loop2
shoot:
    call shoot_plane
    jmp check_keyboard
quit:
    mov ax, 4c00h
    int 21h



;----------------子过程:画水平直线------------------------
;cx: 水平直线起始点坐标x
;dx: 水平直线起始点坐标y
;si: 水平直线长度
;-------------------------------------------------------
sp_line proc  
         push ax  
         push bx  

         mov al,3  ; 设置线条颜色 
         mov ah,0ch  
; ah(0c); int 10h:
; AL = Color, BH = Page Number, CX = x, DX = y
lop:     int 10h ; 触发中断，画一个像素点 
         inc cx  
         dec si 
         jnz lop

         pop bx  
         pop ax  
         ret  
sp_line endp  

;----------------子过程:画水平直线------------------------
;cx: 水平直线起始点坐标x
;dx: 水平直线起始点坐标y
;si: 水平直线长度
; 注意是画黑线
;-------------------------------------------------------
sp_line_b proc  
         push ax  
         push bx  

         mov al,0  ; 设置线条颜色 
         mov ah,0ch  
; ah(0c); int 10h:
; AL = Color, BH = Page Number, CX = x, DX = y
lop_b:     int 10h ; 触发中断，画一个像素点 
         inc cx  
         dec si 
         jnz lop_b

         pop bx  
         pop ax  
         ret  
sp_line_b endp  

;------------------画飞机子程序--------------------------
;飞机为一个13行11列的矩形
;bx:飞机矩形左上角坐标x
;bp:飞机矩形左上角坐标y
;画完飞机后同时将飞机新位置记录到存储区plane_pos处 dw  x,y
;-------------------------------------------------------
play_plane proc      
    push cx  
    push dx  
    push es  
    push si  
    push di  
    push ax  
    jmp sk  
  
play_plane_1: dw 6,1,1,5,2,3,5,3,3,5,4,3,4,5,5,3,6,7,1,7,11,1,8,11,4,9,5,5,10,3,4,11,5,3,12,7,4,13,2,7,13,2 ;X,Y,长度  
  
sk:   
    mov cx,ax  
    mov ax,cs  
    mov es,ax  
    mov di,0  ; 作为遍历飞机数据的指针
           
lop2:   
    mov cx,word ptr es:[play_plane_1+di]    ;x  
    add cx,bx  ; 加上水平位置的偏移量
    mov dx,word ptr es:[play_plane_1+di+2]   ;y  
    add dx,bp  ; 加上竖直位置的偏移量
    mov si,word ptr es:[play_plane_1+di+4]    ;长度  
          
    call sp_line  
    add di,6  ; 指针+6，指向下一条线的数据
    cmp di,84 ; 若飞机数据输出完毕，则结束循环
    jne lop2  
          
    ;plane_pos用于记录飞机的位置，此处更新飞机位置  
    mov ds:[plane_pos],bx  
    mov ds:[plane_pos+2],bp   
  
    pop ax   
    pop di  
    pop si  
    pop es  
    pop dx  
    pop cx  
     
    ret  
play_plane endp 

;---------------擦除飞机子程序-------------------------
;飞机为一个13行11列的矩形
; 从内存中读取飞机位置并擦除
;-------------------------------------------------------
play_plane_b proc      
    push cx  
    push dx  
    push es  
    push si  
    push di  
    push ax  
    jmp sk_b  
  
play_plane_1_b: dw 6,1,1,5,2,3,5,3,3,5,4,3,4,5,5,3,6,7,1,7,11,1,8,11,4,9,5,5,10,3,4,11,5,3,12,7,4,13,2,7,13,2 ;X,Y,长度  
  
sk_b:   
    mov cx,ax  
    mov ax,cs  
    mov es,ax  
    mov di,0  ; 作为遍历飞机数据的指针
    mov bx, ds:[plane_pos]
    mov bp, ds:[plane_pos+2] ; 读取当前飞机位置
           
lop2_b:   
    mov cx,word ptr es:[play_plane_1_b+di]    ;x  
    add cx,bx  ; 加上水平位置的偏移量
    mov dx,word ptr es:[play_plane_1_b+di+2]   ;y  
    add dx,bp  ; 加上竖直位置的偏移量
    mov si,word ptr es:[play_plane_1_b+di+4]    ;长度  
    call sp_line_b  
    add di,6  ; 指针+6，指向下一条线的数据
    cmp di,84 ; 若飞机数据输出完毕，则结束循环
    jne lop2_b  
  
    pop ax   
    pop di  
    pop si  
    pop es  
    pop dx  
    pop cx  
     
    ret  
play_plane_b endp 



;-------------------移动飞机子程序---------------------
;di:控制飞机飞行方向 
; di:
;   1 - up
;   2 - down
;   3 - left
;   4 - right
;可能需要控制飞机是否能飞出边界
;----------------------------------------------------
move_plane proc
    push bx
    push bp

    call play_plane_b
    mov bx, ds:[plane_pos]; 读取现在飞机的位置
    mov bp, ds:[plane_pos+2]

    cmp di, 1
    je up_m
    cmp di, 2
    je down_m
    cmp di, 3
    je left_m
    cmp di, 4
    je right_m 
    jmp move_ret

up_m:
    dec bp
    dec bp
    dec bp
    dec bp
    call play_plane
    jmp move_ret
down_m:
    inc bp
    inc bp
    inc bp
    inc bp
    call play_plane
    jmp move_ret
left_m:
    dec bx
    dec bx
    dec bx
    dec bx
    call play_plane
    jmp move_ret
right_m:
    inc bx
    inc bx
    inc bx
    inc bx
    call play_plane
    jmp move_ret

move_ret:
    pop bp
    pop bx
    ret

move_plane endp


;-----------------------射击-------------------------
; 会从存储区读取当前飞机位置，并且确定炮弹发射口
;----------------------------------------------------
shoot_plane proc
    push dx
    push cx
; 入口参数
; 发射口：bx+5, bp
; 所用到的寄存器及说明
; 子弹坐标： cx, dx
    mov cx, ds:[plane_pos]
    add cx, 5
    mov dx, ds:[plane_pos+2]
; 子弹属性：ax, bx
begin_shoot:; 发射一列炮弹
    mov bx, 0
    mov ah, 0ch
    mov al, 02h
    int 10h
    cmp dx, 0
    je end_shooting 
    dec dx
    jmp begin_shoot

; 炮弹已发射，判断分数及退出
end_shooting:
    call delay
;擦除炮弹轨迹
    mov cx, ds:[plane_pos]
    add cx, 5
    mov dx, ds:[plane_pos+2]
end_shoot:
    mov bx, 0
    mov ah, 0ch
    mov al, 0
    int 10h
    cmp dx, 0
    je shoot_ret
    dec dx
    jmp end_shoot

shoot_ret:
    pop cx
    pop dx
    ret
shoot_plane endp


; ------------------------- 敌人 ------------------

; 开始生成敌人

; 读取状态，只要还存活就不断循环向下，并且更新在存储区中的位置，一旦挂掉就执行下面的语句（这里是一个小循环）
; 或者y一旦超出了200，就将score减少，hp减少，同样执行下面的语句

; 擦除原来的敌人，回到第一条，生成新的敌人，继续 


;----------------延时------------------------
delay proc 
	push dx
	push cx

	mov cx,00a0h
sleep2:
	mov dx,0ff0h ;让程序暂停一段时间

sleep1: 
	dec dx
	cmp dx,0
	jne sleep1

	dec cx
	cmp cx,0
	jne sleep2

	pop cx
	pop dx
	ret
delay endp
;----------------延时------------------------



code ends
end start
