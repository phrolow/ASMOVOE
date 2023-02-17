.model tiny
.code

org 100h

Start: 	call Clean

	include clean.asi

	mov ax, 4c00h
	int 21h

end	Start