.model tiny
.code

org 100h

Start:	call Decin

	mov ax, 4c00h
	int 21h

	include decin.asi

buf	db 6, 0, 6-1+2 dup (0)

end	Start