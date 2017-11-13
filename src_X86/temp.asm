

;-------------------移动飞机子程序---------------------
;di:控制飞机飞行方向 
;可能需要控制飞机是否能飞出边界
;----------------------------------------------------
move_plane proc
    push bx
    push bp

    cmp di, 1
    je up
    cmp di, 2
    je down
    cmp di, 3
    je left
    cmp di, 4
    je right 

up:
    call play_plane_b
    mov bx, ds:[plane_pos]; 读取现在飞机的位置
    mov bp, ds:[plane_pos+2]
    inc bp
    call play_plane
    jmp move_ret

down:

left:

right:

move_ret:
    pop bp
    pop bx
    ret

move_plane endp



