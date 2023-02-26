.model tiny
.code

locals @@

org 100h

Start:  mov si, 80h
        
        lodsb

        xor bh, bh
        mov bl, al                      ; bl is length of our string

        inc si
        lodsb

        sub al, '0'
        cmp al, 0

        jne ncbrd

        sub bl, 9                       ; length minus char of our custom border

        mov di, offset cbrd

        REPT 9

        lodsb
        stosb

        ENDM

ncbrd:  sub bl, 1

        xor dx, dx                      ; wanna set height and length

        mov ax, bx
        mov dl, 10                      ; 10 chars in one line

        div dl                          ; wanna know how many lines will be
        mov dl, 30

        mov dh, al
        add dl, dl                      ; convert to vm px (2 bytes)
        
        add dh, 5

        mov di, 0B800h
        mov es, di

        mov di, 80 * 25
        
        xor cx, cx
        mov cl, dl

        sub di, cx                      ; x of lt

        mov cl, dh

        REPT 160

        sub di, cx                      ; y of lt 

        ENDM                            ; di to start

        add dh, 5

        mov ah, 01Eh                    ; 24 Feb......

        mov si, 82h

        mov cl, byte ptr [si]
        sub cl, '0'
        xor ch, ch                      ; cl is type

        mov si, offset cbrd

        cmp cl, 0
        je custom

@@next: add si, 9
        loop @@next

custom:

        call Border

        mov ax, 4C00h
        int 21h

        include bordre.asi

cbrd    db   ?,   ?,   ?,   ?,   ?,   ?,   ?,   ?,   ?  ; custom border
brd1    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd2    db 80h, 80h, 80h, 80h, 00h, 80h, 80h, 80h, 80h
brd3    db 1Eh, 1Eh, 1Eh, 1Eh, 00h, 1Eh, 1Eh, 1Eh, 1Eh
brd4    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd5    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h

end     Start

