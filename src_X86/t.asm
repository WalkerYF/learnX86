assume cs:code

code segment
start:
    mov al, 2
    in al, 70h

    out bl, 71h    

    mov ax, 4c00h
    int 21h
code ends
end start