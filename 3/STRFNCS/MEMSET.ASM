.model tiny
.code

org 100h

locals @@

Start:  mov ah, 0Ah
        mov dx, offset outl
        int 21h

        mov ah, 0Ah
        mov dx, offset args
        int 21h

        mov bx, offset args
        mov ax, [bx + 2]
        xor ah, ah
        push ax                         ; count

        mov ax, [bx + 4]
        xor ah, ah
        push ax                         ; char

        mov ax, offset outl
        add ax, 2
        push ax                         ; dest

        call memset
        
        dec si

        call fout

        mov ax, 04C00h
        int 21h

include memset.asi

include out.asi

frame   db 'D', 'E', 'D', 'E', ' ', 'E', 'D', 'E', 'D'
jopa    db 10, 0, 10 dup(0)
args    db 5, 0, 0, 0, 0
outl    db 10, 0, 10 dup(0)

end     Start