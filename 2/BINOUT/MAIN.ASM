.model tiny
.code

org 100h

Start:	mov ax, word ptr 65535d
	mov bx, 80 * 25

	call Binout

	mov ax, 4c00h
	int 21h

	include binout.asi

end	Start