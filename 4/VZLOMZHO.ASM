.286
.model tiny
.code
org 100h

Start:  jmp EOP

New09   proc
        push ax bx es                                   ;copy data

        mov bx, 0b800h
        mov es, bx                                      ; video mem
        mov ah, 0CEh                                     ; colors
        mov bx, 160d * 5 + 86d                          ; in the middle of screen

        in al, 60h                                      ; 60h -> al
        mov es:[bx], ax                                 ; print it un video mem

        in al, 61h                                      ; blinking
        or al, 80h
        out 61h, al
        and al, not 80h
        out 61h, al

        mov al, 20h                                     ; end of interrupt
        out 20h, al

        pop es bx ax

                db 0eah
Old09Ofs        dw 0h
Old09Seg        dw 0h

        iret
        endp

EOP:    cli

        xor bx, bx
        mov es, bx
        mov bx, 4 * 9                                   ; 8 interruption - keyboard
        
        mov ax, es:[bx]
        mov Old09Ofs, ax                                ; old interrupt
        mov es:[bx], offset New09                       ; change on new version

        add bx, 2
        mov ax, es:[bx]
        mov Old09Seg, ax                                ; pointer on segment
        mov ax, cs
        mov es:[bx], ax                                 ; NewSegment

        sti

        

        mov ax, 3100h
        mov dx, offset EOP
        shr dx, 4
        inc dx
        int 21h

end     Start