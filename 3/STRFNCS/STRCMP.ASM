.model tiny
.code

org 100h

locals @@

Start:  mov ah, 0Ah
        mov dx, offset str1
        int 21h

        mov ah, 0Ah
        mov dx, offset str2
        int 21h

        call frm

        mov ax, offset str2                 ; str2
        add ax, 2
        push ax

        mov ax, offset str1                 ; ptr to str1
        add ax, 2
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
str1    db 10, 0, 10 dup(0)
str2    db 10, 0, 10 dup(0)

end     Start