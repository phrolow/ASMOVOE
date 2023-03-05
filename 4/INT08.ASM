.286
.model tiny
.code
org 100h

Start:  jmp EOP

New1C   proc
        push ax bx es                                   ;copy data

        mov bx, 0b800h
        mov es, bx                                      ; video mem
        mov ax, 0CE02h                                     ; colors
        mov bx, 160d * 5 + 86d                          ; in the middle of screen
        mov es:[bx], ax

        pop es bx ax

                db 0eah
Old1COfs        dw 0h
Old1CSeg        dw 0h

        iret
        endp

EOP:    cli

        xor bx, bx
        mov es, bx
        mov bx, 4 * 1Ch                                   ; 1Ch interruption - keyboard
        
        mov ax, es:[bx]
        mov Old1COfs, ax                                ; old interrupt
        mov es:[bx], offset New1C                       ; change on new version

        add bx, 2
        mov ax, es:[bx]
        mov Old1CSeg, ax                                ; pointer on segment
        mov ax, cs
        mov es:[bx], ax                                 ; NewSegment

        sti

        mov ax, 3100h
        mov dx, offset EOP
        shr dx, 4
        inc dx
        int 21h

end     Start