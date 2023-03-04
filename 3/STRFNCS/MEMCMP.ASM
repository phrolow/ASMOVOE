.model tiny
.code

org 100h

locals @@

Start:  mov ah, 0Ah
        mov dx, offset args
        int 21h

        mov ah, 0Ah
        mov dx, offset str1
        int 21h

        mov ah, 0Ah
        mov dx, offset str2
        int 21h

        call frm

        mov bx, offset args
        mov ax, [bx + 2]
        xor ah, ah
        push ax                              ; length

        mov ax, offset str2                 ; str2
        add ax, 2
        push ax

        mov ax, offset str1                 ; ptr to str1
        add ax, 2
        push ax

        call memcmp

        xor ah, ah
        mov bx, (40 * 25 - 2) * 2

        call hexout

        mov ax, 04C00h
        int 21h

include hexout.asi
include memcmp.asi
include stdfrm.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
str1    db 10, 0, 10 dup(0)
str2    db 10, 0, 10 dup(0)
args    db 3, 0, 0, 0, 0, 0

end     Start