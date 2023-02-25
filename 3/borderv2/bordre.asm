.model tiny
.code

org 100h

Start:  mov si, offset brd
        mov ah, 071h
        mov bx, 0B800h
        mov es, bx
        mov di, 80 * 7 * 2
        mov dl, 4
        mov dh, 11

        call Border

        mov ax, 4C00h
        int 21h

;
; args - ah, di, dl, si
; ah - attribute
; di - start
; dl - width
; si - border source
; dh - height
; destroys - dohuya
;

Border  proc
        push bp

        call String

        add di, 80 * 2

        xor bh, bh              ; cringe
        mov bl, dl

        sub di, bx
        sub di, bx

        mov bp, dx
        and bp, 0FF00h
        shr bp, 8
        sub bp, 2

zaloop: call String

        sub si, 3

        add di, 80 * 2

        xor bh, bh              ; cringe
        mov bl, dl

        sub di, bx
        sub di, bx

        dec bp

        cmp bp, 0
        jne zaloop

        add si, 3
        
        call String

        pop bp
        ret
        endp

        include string.asi

brd     db 'huipizdaK'

end     Start