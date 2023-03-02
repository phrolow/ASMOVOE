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
        xor ah, ah                      ; dl в общ

        cmp dh, 0
        jne not_smol_txt1               ; концептуально - сначала идет распечатка "больших" строк, а потом маленькой; ну и здесь джамп сразу к распечатке маленькой; важно не проебать dl

        jmp smol_txt

not_smol_txt1:

        sub di, word ptr 20

        mov cl, dh
        xor ch, ch

        REPT 160
        
        sub di, ax

        ENDM

        inc si

@@Next: 
        cmp cl, 0
        jne not_smol_txt

        jmp smol_txt

not_smol_txt:

        mov ah, 1Eh

        REPT 10

        lodsb
        stosw

        ENDM

        dec cl
        add di, (80 - 10) * 2

        jmp @@Next

smol_txt:
        add di, 10

        mov al, dl
        xor ah, ah

        sub di, ax

        mov cx, dx
        xor ch, ch
        sub cx, 1                       ; fix 

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