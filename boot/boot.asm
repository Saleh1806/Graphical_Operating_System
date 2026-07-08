[org 0x7c00]
[bits 16]

start:
    mov ax, 0xB800
    mov es, ax

    mov byte [es:0x00], 0x48
    mov byte [es:0x01], 0x0F

    cli
    hlt

    times 510 - ($ - $$) db 0
    db 0x55, 0xaa