.model tiny
.code

org 100h

Start:	mov bx, 0b800h
	mov es, bx

	xor bx, bx
	mov ah, 2ch
	mov dx, offset Msg
	mov si, dx

Next:	mov al,	     [si]
	mov es:[bx], ax

	add bx, 2
	inc si
	inc ah
	
	cmp al, 24h
	jne Next

	xor si, si

	mov ax, 4c00h
	int 21h

Msg:	db 'hui$'

end 	Start