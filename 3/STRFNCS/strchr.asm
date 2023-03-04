.model tiny
.code

locals @@

org 100h

Start:  mov ah, 0Ah
        mov dx, offset jopa
        int 21h

        mov ah, 0Ah
        mov dx, offset args
        int 21h

        call frm

        mov bx, offset args
        mov ax, [bx + 2]
        push ax                                                  ; what to seek

        mov ax, offset jopa
        add ax, 2
        push ax                                        ; where

        call strchr

        cmp si, 0
        je nullptr

        sub si, offset jopa
        dec si

nullptr:
        dec si

        mov ax, si
        mov bx, (40 * 25 - 2) * 2

        call hexout

        mov ax, 04C00h
        int 21h

include hexout.asi
include strchr.asi
include stdfrm.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
jopa    db 10, 0, 10 dup(0)
args    db 3, 0, 0, 0, 0

end     Start