.model tiny
.code

org 100h

locals @@

Start:  call frm

        mov ah, 0Ah
        mov dx, offset jopa
        int 21h

        mov ah, 0Ah
        mov dx, offset args
        int 21h

        mov bx, offset args
        mov ax, [bx + 2]
        xor ah, ah
        push ax                                  ; length

        mov bx, offset args
        mov ax, [bx + 4]
        xor ah, ah
        push ax                                  ; char to search

        mov ax, offset jopa                     ; ptr to mem
        add ax, 2
        push ax

        call memchr

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
include memchr.asi
include stdfrm.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
jopa    db 10, 0, 15 dup(0)
args    db 5, 0, 5 dup(0)

end     Start