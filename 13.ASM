.model tiny
.code

org 100h

Start:	ret

	mov dx, offset Msg
	int 21h

	mov ax, 0c005h
	int 21h

.data

Msg	db 'ochko negra', '$'

end	Start