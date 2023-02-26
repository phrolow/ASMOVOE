.model tiny
.code

locals @@

org 100h

Start:  call Text

        mov ax, 4C00h
        int 21h

Text    proc

        mov si, offset txt

        lodsb

        xor ah, ah

        mov dl, 10

        div dl

        mov dh, al
        mov dl, ah

        mov di, 0B800h
        mov es, di

        mov di, 80 * 25

        mov ax, dx
        xor ah, ah               ; dl в общ

        cmp dh, 0
        jne not_smol_txt1            ; концептуально - сначала идет распечатка "больших" строк, а потом маленькой; ну и здесь джамп сразу к распечатке маленькой; важно не проебать dl

        jmp smol_txt

not_smol_txt1:

        sub di, word ptr 30

        mov al, dh

        REPT 80
        
        sub di, ax

        ENDM

        inc si

@@Next: cmp ax, 0
        jne not_smol_txt

        jmp smol_txt

not_smol_txt:

        mov ah, 1Eh

        REPT 60

        lodsb
        stosw

        ENDM

        dec ax
        add di, (80 - 60) * 2

        jmp @@Next

smol_txt:

        mov al, dl
        xor ah, ah

        sub di, ax

        mov cx, dx
        xor ch, ch

        mov ah, 1Eh

        and di, 0FFFEh                  ; need even di

@@Next2:

        lodsb
        stosw

        loop @@Next2

        ret
        endp

txt     db 52, 20h, 'Govnozalupapenisherdavalkahuyblyadinasukayeblanishe'

end     Start