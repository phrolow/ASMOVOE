.model tiny
.code

org 100h

locals @@

Start:  call frm

        mov ax, offset str2                 ; str2
        push ax

        mov ax, offset str1                 ; ptr to str1
        push ax

        call strcmp

        xor ah, ah
        mov bx, (40 * 25 - 2) * 2

        call hexout

        mov ax, 04C00h
        int 21h

include hexout.asi
include strcmp.asi
include stdfrm.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
str1    db 1, 2, 3, '$'
str2    db 1, 2, 3, '$'

end     Start