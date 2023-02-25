.model tiny
.code

org 100h

Start:  call input

        mov ax, 4C00h
        int 21h

input   proc

        

        ret
        endp

end     Start