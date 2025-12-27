[org 0x7c00]
    mov bp, 0x8000
    mov sp, bp

    mov bx, 0x9000  ; int 0x13规定数据存放在es:bs指向的内存位置
    mov dh, 2
    call disk_load

    mov dx, [0x9000]  ; 在0x9000取第二个扇区的数据
    call print_hex

    call print_nl

    mov dx, [0x9000 + 512]  ; 取第三个扇区的数据
    call print_hex

    jmp $

%include "../bootsector_functions_strings/boot_sect_print.asm"
%include "../bootsector_functions_strings/boot_sect_print_hex.asm"
%include "boot_sect_disk.asm"

times 510 - ($-$$) db 0
dw 0xaa55

; sector 2 and sector 3
times 256 dw 0xdada
times 256 dw 0xface
