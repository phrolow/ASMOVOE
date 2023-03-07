.model tiny
.code

locals @@

org 100h

Start:  mov bx, 0B800h
        mov es, bx

        mov ah, 0Fh
        mov di, 0
        mov dl, 10
        mov dh, 9
        mov si, offset frame

        call border

        xor si, si
        lea di, buf

        call fillbuf
        
        mov bx, 0B800h
        mov es, bx

        mov ah, 1Eh
        mov di, 0
        mov dl, 10
        mov dh, 9
        mov si, offset frame

        call border

        lea si, buf
        mov di, 80 * 10 + 10

        call loadbuf

        mov ax, 4C00h
        int 21h

        include loadbuf.asi
        include fillbuf.asi
        include bordre.asi

buf     dw 90 dup(0)
SaveBuf dw 90 dup(0)
frame   db 0C9h, 0CDh, 0BBh, 0BAh, 000h, 0BAh, 0C8h, 0CDh, 0BCh 

end     Start