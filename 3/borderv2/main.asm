.model tiny
.code

org 100h

locals @@

Start:  mov si, offset cmd                              ; will be 80h
        inc si

        xor ah, ah

        lodsb
        mov di, ax                                      ; x of lt
        add di, di

        lodsb                                           ; y of lt
        mov bl, 80 * 2
        mul bl

        add di, ax                                      ; now di is start of border

        lodsb
        shl ax, 8

        lodsb
        mov dx, ax                                      ; dh is height, dl is width

        lodsb
        mov ah, al

        lodsb
        
        xor bx, bx

        REPT 9
        add bl, al
        ENDM
        
        add bx, offset cbrd

        cmp al, 0
        jne to_vm

        REPT 9
        lodsb

        mov [bx], al

        inc bx
        ENDM

 to_vm: mov si, bx
 
        mov bx, 0B800h
        mov es, bx

        call Border

        mov bx, dx
        xor bh, bh

        sub di, bx
        shr dx, 8
        REPT 80
        sub di, dx
        ENDM

        mov si, offset cmd                              ; will be 80h
        xor ch, ch
        mov cl, [si]

        mov bx, [si + 6]

        cmp bl, 0

        jne ncbrd

        add si, 9

ncbrd:  sub cl, 6
        
        sub di, cx
        and di, 0FFFEh

        add si, 7                          ; will be 87h

@@Next: lodsb
        stosw

        loop @@Next

        mov ax, 4C00h
        int 21h

include bordre.asi

cmd     db 14h, 3, 3, 8, 65, 01Eh, 0, 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h, 'i hate niggers'

cbrd    db   ?,   ?,   ?,   ?,   ?,   ?,   ?,   ?,   ?  ; custom border
brd1    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd2    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd3    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd4    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h
brd5    db 40h, 40h, 40h, 40h, 00h, 40h, 40h, 40h, 40h

end     Start