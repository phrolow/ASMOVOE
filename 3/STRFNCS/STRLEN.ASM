.model tiny
.code

org 100h

locals @@

Start:  mov ax, offset jopa
        push ax

        call strlen

        add bl, '0'
        mov di, offset outl
        inc di
        mov [di], byte ptr bl

        mov si, offset outl
        
        call fout

        mov ax, 04C00h
        int 21h

include strlen.asi

include out.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
jopa    db 1, 2, 3, '$'
outl    db 2, 0

end     Start