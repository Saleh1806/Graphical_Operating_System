[org 0x7c00]
[bits 16]

start:
    cli
    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov sp, 0x7c00
    sti
    cld

    mov ax, 0x0003
    int 0x10

    mov ax, 0xB800
    mov es, ax
    xor di, di

clear:
    mov ax, 0x0720
    mov cx, 80*25

.clear:
    stosw
    loop .clear
main:
    mov word [es:0x00], 0x0F48

.hang:
    hlt
    jmp .hang

times 510 - ($ - $$) db 0
dw 0xAA55