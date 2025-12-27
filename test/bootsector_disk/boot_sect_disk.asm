disk_load:
	pusha
	push dx  ; 用于之后的返回值检查

	mov ah, 0x02
	mov al, dh  ; call借助dh来传递参数(用于读取的扇区数量)
	mov cl, 0x02  ; 0x02是第二个扇区
	mov ch, 0x00  ; 柱面号0
	mov dh, 0x00  ; 盘面号0

	int 0x13
	jc disk_error  ; jc:是否产生进位
	
	pop dx
	cmp al, dh  ; int 0x13结束之后会返回此次读的扇区数在al之中
	jne sectors_error
	popa
	ret

disk_error:
	mov bx, DISK_ERROR
	call print
	call print_nl
	mov dh, ah  ; 如果出错BIOS会将status code写入ah
	call print_hex
	jmp disk_loop

sectors_error:
	mov bx, SECTORS_ERROR
	call print
	call print_nl


disk_loop:
	jmp $


DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0

