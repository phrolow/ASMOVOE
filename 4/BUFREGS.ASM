.286
.model tiny
.code

locals @@

org 100h

Start:  jmp EOP

Old1C   proc
        iret
        endp

include bufregs.asi
include set1c.asi
include reset1c.asi
include mode1c.asi
include bordre.asi
include fillbuf.asi
include loadbuf.asi
include refrbuf.asi
include hexout2.asi

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

        mov ax, 3100h                                   ; TSR
        mov dx, offset EOP
        shr dx, 4
        inc dx
        int 21h

end     Start