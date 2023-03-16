.model tiny
.code

locals @@

org 100h

Start:  lea ax, ask
        push ax
        call frameout
        
        call AskPass

        lea di, buf
        push di

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

        include strcmp.asi
        include out.asi
        include bordre.asi
        include text2.asi


ask     db 'Input password',    0Dh
deny    db 'Access denied',     0Dh
got     db 'Access got',        0Dh

AskPass proc

        lea di, buf

Input:  mov ax, cs
        mov es, ax                  ; 

        mov ah, 01h
        int 21h

        stosb

        cmp al, 0Dh                 ; if end of line
        jne Input

        ret
        endp

buf     db 0

end     Start