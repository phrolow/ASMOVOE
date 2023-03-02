; task was to set a resident into program

.286
.model tiny
.code
org 100h
locals @@

Start   cli

        xor bx, bx
        mov es, bx
        mov bx, 9 * 4

        mov ax, es:[bx]
        mov Old09Ofs, ax

        mov es:[bx], offset New09

        add bx, 2
        mov ax, es:[bx]
        mov Old09Seg, ax

        mov ax, cs
        mov es:[bx], ax

        sti

        mov ax, 4C00h
        int 21h

New09   proc

        push ax bx es

        mov bx, 0B800h

        mov es, bx
        mov ah, 4Eh
        mov bx, 160 * 5 + 80

        in al, 60h
        mov 