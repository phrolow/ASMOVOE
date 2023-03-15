.model tiny
.code

locals @@

org 100h

Start:  lea ax, ask
        push ax
        call frameout
        
        lea dx, buf
        mov ah, 0Ah
        int 21h

        add dx, 2
        push dx

        lea dx, password
        push dx

        call strcmp

        cmp al, 0
        jne False

        lea ax, got
        push ax
        call frameout
        jmp ProgEnd

False:  lea ax, deny
        push ax
        call frameout

ProgEnd:

        mov ax, 4C00h
        int 21h
        
frame   db 0C9h, 0CDh, 0BBh, 0BAh, 000h, 0BAh, 0C8h, 0CDh, 0BCh
password db 'SHXTHVPP3N5', 0Dh
buf     db 0FFh, 0, 12 dup(0)

        include strcmp.asi
        include out.asi
        include bordre.asi
        include text2.asi


ask     db 'Input password',    0Dh
deny    db 'Access denied',     0Dh
got     db 'Access got',        0Dh

end     Start