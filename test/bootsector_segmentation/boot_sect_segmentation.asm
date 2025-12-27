mov ah, 0x0e  ; tty mode



; attemp1
mov bx, 0x7c0
mov ds, bx
mov al, [the_secret]
int 0x10


; attemp2
mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret]
int 0x10


jmp $

the_secret:
	db "X"

times 510 - ($-$$) db 0
dw 0xaa55
