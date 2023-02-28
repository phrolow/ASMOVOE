.model tiny
.code

org 100h

locals @@

Start:  mov ax, 4
        push ax

        mov ax, offset jopa
        push ax

        mov ax, offset outl
        inc ax
        push ax

        call memcpy
        
        dec di
        mov si, di

        call fout

        mov ax, 04C00h
        int 21h

include memcpy.asi

include out.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
jopa    db 1, 2, 3, '$'
outl    db 8, 5, 5, 5, 5, 5, 5, 5, 5, 5, '#'

end     Start