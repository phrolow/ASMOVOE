.model tiny
.code

org 100h

locals @@

Start:  mov ah, 0Ah
        mov dx, offset args
        int 21h

        mov ah, 0Ah
        mov dx, offset src
        int 21h

        mov ah, 0Ah
        mov dx, offset outl
        int 21h

        mov bx, offset args
        mov ax, [bx + 2]
        xor ah, ah
        push ax                                 ; count

        mov ax, offset src
        add ax, 2
        push ax                                 ; source

        mov ax, offset outl
        add ax, 2
        push ax                                 ; dest

        call memcpy
        
        dec di
        mov si, di

        call fout

        mov ax, 4C00h
        int 21h

include memcpy.asi

include out.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
src     db 10, 0, 10 dup(0)
outl    db 10, 0, 10 dup(0)
args    db 3, 0, 0, 0, 0

end     Start