.model tiny
.code

org 100h

locals @@

Start:  mov ah, 0Ah
        mov dx, offset outl
        int 21h

        mov dx, offset src
        int 21h

        mov ax, offset src
        add ax, 2
        push ax

        mov ax, offset outl
        add ax, 2
        push ax

        call strcpy
        
        dec di
        mov si, di

        call fout

        mov ax, 04C00h
        int 21h

include strcpy.asi

include out.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
src     db 10, 0, 10 dup(0)
outl    db 10, 0, 10 dup(0)

end     Start