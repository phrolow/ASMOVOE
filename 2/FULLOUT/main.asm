.model tiny
.code

locals @@

org 100h

Start:  mov ax, 228
        mov bx, (80 * 10 + 7) * 2

        call Fullout
        
        mov ax, 4C00h
        int 21h

        include fullout.asi

end     Start