.286
.model tiny
.code

locals @@

org 100h

Start:  jmp EOP

include showregs.asi
include hexout2.asi

EOP:    cli

        xor bx, bx
        mov es, bx
        mov bx, 4 * 1Ch                                 ; 1Ch interruption - keyboard
        
        mov es:[bx], offset New1C                       ; change on new version

        mov ax, cs
        mov es:[bx + 2], ax                                 ; NewSegment

        sti

        mov ax, 3100h
        mov dx, offset EOP
        shr dx, 4
        inc dx
        int 21h

end     Start