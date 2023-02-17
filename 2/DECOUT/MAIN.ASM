.model tiny
.code

org 100h

Start:	mov ax, 228d
	mov bx, 80 * 25

	call Decout

	mov ax, 4c00h
	int 21h

	include decout.asi

end	Start