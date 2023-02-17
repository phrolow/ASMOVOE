.model tiny
.code

org 100h

Start:  mov bx, 80 * 20 * 2
        mov dx, offset lb0

        call Msg

        mov bx, 4C00h
        int 21h

Msg   	proc

        mov di, 0B800h
        mov es, di

        mov di, bx                  ; bx is pointer to vm

        mov bx, dx                  ; dx is shit
        inc bx

        mov cx, [bx]                ; num of chars
	xor ch, ch
	dec cx

??Next: inc bx

	mov dx, [bx]
	mov dh, 0CEh

        mov es:[di], dx

        add di, 2
        
        loop ??Next

        ret
        endp

lb0     db 6, 6, 'pizda'

end	Start