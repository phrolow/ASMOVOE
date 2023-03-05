.model tiny
.code

locals @@

org 100h

Start:  push ax bx cx dx es bp                                  ;copy data
        
        mov bp, sp

        mov di, (80 * 3 + 36) * 2
;        mov si, offset RegName

        mov cx, 4
        add bp, 10

@@Next: add di, 156 * 2
        mov ah, 3Ah

;        mov al, cs:[si]
;        inc si
;        stosw

;        mov al, cs:[si]
;        inc si
;        stosw

        add di, 2 * 4

        mov ax, [bp]
        mov bx, di

        sub bp, 6

        call hexout

        loop @@Next

        add bp, 2

        pop bp es dx cx bx ax

        include hexout.asi

end     Start