.model tiny
.code

org 100h

Start:	mov ax, 0F00Dh
	mov bx, 80 * 25
	
	call hexout

	mov ax, 4c00h
	int 21h

	include hexout.asi

end	Start