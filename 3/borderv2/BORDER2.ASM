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
     
        mov cx, 9

ReadCustom:

        lodsb
        stosb

        loop ReadCustom

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

        mov bp, cx

        mov cx, word ptr 80 * 2

lty:    sub di, bp                      ; y of lt 

        loop lty                        ; di to start

        add dh, 5

        mov si, 82h

        mov cl, byte ptr [si]
        sub cl, '0'
        xor ch, ch                      ; cl is type

        mov si, offset cbrd

        cmp cl, 0
        je custom

@@next: add si, 10
        loop @@next

        lodsb
        mov ah, al

custom:

        call Border

        mov si, 82h

        cmp byte ptr [si], byte ptr '0'

        mov cl, [si]
        xor ch, ch
        sub cx, '0'
        
        mov bx, offset cbrd

GetStyle:

        cmp cx, 0
        je StyleGot

        add bx, 10
        dec cx

        jmp GetStyle

StyleGot:

        mov ah, [bx]
        add si, 2

        call Text

        mov ax, 4C00h
        int 21h

        include bordre.asi
        include text2.asi

cbrd    db    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?  ; custom border
brd1    db 01Fh, 0C9h, 0CDh, 0BBh, 0BAh, 000h, 0BAh, 0C8h, 0CDh, 0BCh 
brd2    db 071h, 080h, 080h, 080h, 080h, 000h, 080h, 080h, 080h, 080h 
brd3    db 022h, 01Eh, 01Eh, 01Eh, 01Eh, 000h, 01Eh, 01Eh, 01Eh, 01Eh 
brd4    db 01Eh, 040h, 040h, 040h, 040h, 000h, 040h, 040h, 040h, 040h 
brd5    db 0CEh, 040h, 040h, 040h, 040h, 000h, 040h, 040h, 040h, 040h 

end     Start


