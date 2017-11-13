    mov cx, 0
    mov dx, 0
    mov si, 320
    mov bx, 1
    call sp_line  ; 画一条直线

    call delay


    mov bx, 10
    mov bp, 50
    call play_plane ; 画一架飞机

    mov cx, 10
s:
    call delay
    mov di, 2
    call move_plane
    loop s

    mov cx, 10
s1:
    call delay
    mov di, 3
    call move_plane
    loop s1

    mov cx, 10
s2:
    call delay
    mov di, 4
    call move_plane
    loop s2