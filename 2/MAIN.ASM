.model tiny
.code

locals @@

org 100h

Start:	call Clear

		mov ax, (80 * 19 + 74) * 2
		mov bx, (80 * 6  +  5) * 2

		call Border

		mov dx, offset lsum
		mov bx, (80 * 8 + 15) * 2

		call Msg

		mov dx, offset lsub
		mov bx, (80 * 11 + 15) * 2

		call Msg

		mov dx, offset lmul
		mov bx, (80 * 14 + 15) * 2

		call Msg

		mov dx, offset ldiv
		mov bx, (80 * 17 + 15) * 2

		call Msg

		mov dx, offset buf

		call Decin

		mov bp, ax

		mov dx, offset buf

		call Decin

		mov si, ax

		add ax, bp

		mov bx, (80 * 8 + 30) * 2

		call Fullout

		mov ax, bp
		sub ax, si

		mov bx, (80 * 11 + 30) * 2

		call Fullout

		mov ax, bp
		mul si

		mov bx, (80 * 14 + 30) * 2

		call Fullout

		xor dx, dx
		mov ax, bp
		div si

		mov bx, (80 * 17 + 30) * 2

		call Fullout
		
		mov ax, 4C00h
		int 21h

		include BORDER/border.asi
		include CLEAR/clear.asi
		include DECIN/decin.asi
		include FULLOUT/fullout.asi
		include MSG/msg.asi

buf	db 	6, 0, 6-1+2 dup (0)
lsum	db	5, 5, 'Sum:'
lsub db	5, 5, 'Sub:'
lmul db	5, 5, 'Mul:'
ldiv db	5, 5, 'Div:'

end	Start