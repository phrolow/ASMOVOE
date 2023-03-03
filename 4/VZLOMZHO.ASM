; task was to set a resident into program

.286
.model tiny
.code
org 100h
locals @@

Start:          jmp EOP

New09           proc

                push ax bx es

                mov bx, 0B800h
                mov es, bx
                mov bx, 80 * 25

                mov es:[bx], 1E41h

                mov al, 20h
                out 20h, al

                pop es bx ax

                db 0EAh

Old09Ofs        dw 0
Old09Seg        dw 0
                
                iret
                endp

EOP:            cli

                xor bx, bx
                mov es, bx
                mov bx, 4 * 9                           ; to int table

                mov ax, es:[bx]
                mov Old09Ofs, ax
                mov es:[bx], offset New09

                add bx, 2

                mov ax, es:[bx]
                mov Old09Seg, ax
                mov ax, cs
                mov es:[bx], ax

                sti

                ;jmp New09

                mov ax, 3100h
                mov dx, offset EOP
                shr dx, 4
                inc dx
                int 21h

end             Start