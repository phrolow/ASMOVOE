.model tiny
.code

org 100h

Start:  mov ax, 1111h
        mov bx, 2222h
        mov cx, 3333h
        mov dx, 4444h

        mov ax, 8600h
        mov cx, 0080h
        xor dx, dx
        int 15h

        mov ax, 4C00h
        int 21h

end     Start