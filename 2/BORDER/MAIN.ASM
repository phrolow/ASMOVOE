.model tiny
.code

org 100h

Start:	mov ax, (80 * 20 + 75) * 2 ; rb
	mov bx, (80 * 5  +  5) * 2 ; lt

	call Border

	mov ax, 4c00h
	int 21h

	include border.asi

end	Start