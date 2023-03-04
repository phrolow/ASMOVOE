.model tiny
.code

org 100h

locals @@

Start:  mov ah, 0Ah
        mov dx, offset jopa
        int 21h

        call frm

        mov ax, offset jopa
        add ax, 2
        push ax

        call strlen

        mov ax, bx
        mov bx, (40 * 25 - 2) * 2
        
        call hexout

        mov ax, 04C00h
        int 21h

include strlen.asi
include hexout.asi
include stdfrm.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
jopa    db 10, 0, 10 dup(0)

end     Start