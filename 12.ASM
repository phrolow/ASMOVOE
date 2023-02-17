.model tiny
.code

org 100h

Start:	mov bx, 0b800h
	mov es, bx	; jump to video

	mov dx, offset buf
	
	mov ah, 0Ah
	int 21h		; buffer input

	mov si, dx
	inc si		; cause dx sucks

	mov al, ds:[si]

	mov bx, 80 * 25 + 1
	sub bl, al	; i wanna mid of screen minus half of string
	
	mov cx, ds:[si]	; loop with <length> steps
	xor ch, ch

	mov ah, 0CEh	; txt color
	
Next:	inc si
	
	mov al, ds:[si]
	mov es:[bx], ax
	
	add bx, 2

	loop Next	; exactly output

	mov ax, 4c00h
	int 21h

buf	db 0FFh, 0, 0FFh dup (0)

end	Start