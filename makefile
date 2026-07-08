all: bootloader

bootloader:
	@echo "Building bootloader..."
	nasm -f bin boot/boot.asm -o boot/boot.img

clear:
	@echo "Cleaning up..."
	rm -f boot/boot.img

clean: clear

run:
	qemu-system-x86_64 -m 64 -fda boot/boot.img -boot a
