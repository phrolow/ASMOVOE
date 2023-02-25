.model tiny
.code
.186

org 100h

Start   mov si, 80h
        
        lodsb

        xor bh, bh
        mov bl, al                      ; bl is length of our string

        lodsb

        cmp al, 0
        jne ncbrd

        sub bl, 9

        mov di, offset cbrd

        mov cx, word ptr 9

        rep stosb

ncbrd:  sub bl, 1

        xor dx, dx                      ; wanna set height and length

        mov ax, bx
        mov dl, 30

        div dl
        mov dh, al
        mov dl, byte ptr 30
        
        cmp al, 0                       ; if there is \b
        jne len_30

        mov dl, ah

len_30: mul dl, dl, 2
        add dh, 5 * 2

        mov di, 0B800h
        mov es, di

        mov di, 80 * 24
        
        xor cx, cx
        mov cl, dl

        sub di, cx

        mov cl, dh

        REPT 80

        sub di, cx

        ENDM                            ; di to start

        mov ah, 01Eh                    ; 24 Feb......

        mov si, 81h

        mov cl, byte ptr [si]
        xor ch, ch                      ; cl is type

        mov si, offset cbrd

        rep add si, 9

        call Border

        mov ax, 4C00h
        int 21h

        include bordre.asi

cbrd    db   ?,   ?,   ?,   ?,   ?,   ?,   ?,   ?,   ?  ; custom border
brd1    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd2    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd3    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd4    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd5    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h

end     Start


