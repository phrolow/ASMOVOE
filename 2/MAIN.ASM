.model tiny
.code

locals @@

org 100h

Start:	call Clear

		mov ax, (80 * 19 + 74) * 2	; rb
		mov bx, (80 * 6  +  5) * 2	; lt

		call Border

		mov dx, offset lsum	
		mov bx, (80 * 8 + 15) * 2	; args for label

		call Msg

		mov dx, offset lsub
		mov bx, (80 * 11 + 15) * 2	; args for label

		call Msg

		mov dx, offset lmul
		mov bx, (80 * 14 + 15) * 2	; args for label

		call Msg

		mov dx, offset ldiv
		mov bx, (80 * 17 + 15) * 2	; args for label

		call Msg

		mov dx, offset buf			; arg for input

		call Decin

		mov bp, ax					; accumulate

		mov dx, offset buf			; arg for input

		call Decin

		mov si, ax					; accumulate

		add ax, bp					; sum

		mov bx, (80 * 8 + 30) * 2	; fullout start

		call Fullout

		mov ax, bp
		sub ax, si					; sub

		mov bx, (80 * 11 + 30) * 2	; fullout start

		call Fullout

		mov ax, bp
		mul si						; mul

		mov bx, (80 * 14 + 30) * 2	; fullout start

		call Fullout

		xor dx, dx
		mov ax, bp
		div si						; div

		mov bx, (80 * 17 + 30) * 2	; fullout start

		call Fullout
		
		mov ax, 4C00h
		int 21h

		include BORDER/border.asi
		include CLEAR/clear.asi
		include DECIN/decin.asi
		include FULLOUT/fullout.asi
		include MSG/msg.asi

buf	db 	6, 0, 6-1+2 dup (0)			; buffer for input
lsum	db	5, 5, 'Sum:'			; labels
lsub db	5, 5, 'Sub:'
lmul db	5, 5, 'Mul:'
ldiv db	5, 5, 'Div:'

end	Start