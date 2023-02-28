.model tiny
.code

org 100h

locals @@

Start:  call frm

        push 4                              ; length

        push 1                            ; char to search

        mov ax, offset jopa                 ; ptr to mem
        push ax

        call memchr

        cmp si, 0
        je nullptr

        sub si, offset jopa
        inc si

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
jopa    db 1, 2, 3, '$'
outl    db 2, 0

end     Start