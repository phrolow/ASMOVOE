.model tiny
.code

org 100h

locals @@

Start:  mov ax, word ptr 9
        push ax

        mov ax, word ptr 2
        push ax

        mov ax, offset outl
        inc ax
        push ax

        call memset
        
        dec si

        call fout

        mov ax, 04C00h
        int 21h

include memset.asi

include out.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
jopa    db 1, 2, 3, '$'
outl    db 10, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5

end     Start