.model tiny
.code

org 100h

Start:  mov ax, 1111
        mov bx, 2222
        mov cx, 3333
        mov dx, 4444

        mov ax, 4C00h
        int 21h

end     Start