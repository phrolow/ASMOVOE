.model tiny
.code

locals @@

org 100h

Start:  mov si, 80h
        
        mov ah, 0Ah

        mov di, 0B800h
        mov es, di

        mov di, (80 * 5 + 10) * 2

        mov dh, 15
        mov dl, 60

        mov si, offset frame

        call Border

        mov si, offset txt

        mov ah, 0Ah

        call Text

        mov ax, 4C00h
        int 21h

        include bordre.asi
        include text2.asi

frame   db 0C9h, 0CDh, 0BBh, 0BAh, 000h, 0BAh, 0C8h, 0CDh, 0BCh
txt     db 'Input password', 0Dh

end     Start
