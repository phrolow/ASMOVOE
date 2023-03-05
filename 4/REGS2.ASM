.286
.model tiny
.code

locals @@

org 100h

Start:  jmp EOP

include showreg.asi
include set08.asi
include reset08.asi
include regs2.asi

Old1C   proc
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