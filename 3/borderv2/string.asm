;
; args - ah, di, dl, si
; ah - attribute
; di - start
; dl - length
; destroys - cx, di, 
;

.model tiny
.code

org 100h

Start:  mov si, offset brd
        mov ah, 0CEh
        mov bx, 0B800h
        mov es, bx
        mov di, 80 * 19 * 2
        mov dl, 4

        call String

        mov ax, 4C00h
        int 21h

String  proc
        push bp

        lodsb
        stosw

        lodsb

        sub dl, 2
        mov cl, dl
        xor ch, ch

@@Next: mov es:[di], ax

        add di, 2

        loop @@Next

        lodsb
        stosw

        pop bp
        ret
        endp

brd     db 'hui'

end     Start