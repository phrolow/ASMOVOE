; task was to set a resident into program

.286
.model tiny
.code
org 100h
locals @@

Start:              jmp Main


;------------------------------------------------
New09               proc
                    push ax bx es

                    mov bx, 0b800h

                    mov es, bx              ; set vidmem

                    mov ah, 4eh             ; set color(red)
                    mov bx, 160d*5 + 80d    ; get vid mem - 5th line

                    in al, 60h              ; read scan code from PPI
                    mov es:[bx], ax         

                    in al, 61h              ; 
                    or al, 80h              ; 10000000 disable keyboard no matter what is set in al

                    out 61h, al
                    and al, not 80h         ; 01111111 enable keyboard

                    mov al, 20h             ; set signal to 20 port
                    out 20h, al

                    db 09Ah

Old09Ofs            dw 0
Old09Seg            dw 0

                    pop es bx ax
                    iret
                    endp
;------------------------------------------------
EOP:


Main:
                    cli                     ; disable interups until 

                    xor bx, bx
                    mov es, bx
                    mov bx, 4*9h            ; set memory on 9h

                    mov ax, es:[bx]
                    mov Old09Ofs, ax

                    mov es:[bx], offset New09

                    add bx, 2
                    mov ax, es:[bx]
                    mov Old09Seg, ax

                    mov ax, cs              ; get ax memory start
                    mov es:[bx], ax         ; write load start because offset New09 is relative

                    sti

                    mov ax, 3100h           ; terminate and stay resident
    
                    mov dx, offset EOP      ; save end of program
                    shr dx, 4               ; dx /= 16
                    inc dx

                    int 21h
                    
end                 Start