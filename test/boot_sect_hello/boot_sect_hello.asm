mov ah, 0x0e  ; tty mode
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10  ; 再次输出l
mov al, 'o'
int 0x10

jmp $  ; 死循环，一直跳转到此处

times 510 - ($-$$) db 0
dw 0xaa55  ; 最后两个字节添加魔数
