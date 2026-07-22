# Graphical Operating System

> A tiny x86 operating-system experiment built from the boot sector up.

<p align="left">
  <a href="#getting-started">Getting started</a> &nbsp;|&nbsp;
  <a href="#project-layout">Project layout</a> &nbsp;|&nbsp;
  <a href="#roadmap">Roadmap</a>
</p>

---

## Overview

**Graphical Operating System** is a low-level learning project that starts at the
very first instruction executed by a machine. The current boot sector switches to
the classic 80 x 25 VGA text mode, clears the display and writes directly to video
memory.

The goal is deliberately simple: grow a small, understandable system one layer at
a time, with no hidden runtime and no unnecessary magic.

| Focus | Current state |
| :--- | :--- |
| Platform | x86, real mode |
| Entry point | 512-byte boot sector |
| Display | VGA text memory (`0xB8000`) |
| Build tool | NASM |
| Emulator | QEMU |

## Getting started

### Requirements

- [NASM](https://www.nasm.us/) to assemble the boot sector
- [QEMU](https://www.qemu.org/) to run the image locally
- `make`

### Build and run

```bash
make
make run
```

To remove the generated image:

```bash
make clean
```

## Project layout

```text
.
|-- boot/
|   |-- boot.asm        # Boot sector: startup, VGA setup and first output
|   `-- boot.img        # Generated bootable image
|-- makefile            # Build, run and clean commands
`-- README.md
```

## What happens at boot

1. The BIOS loads the first sector at `0x7C00` and transfers control to it.
2. The bootloader initializes the segment registers and stack.
3. BIOS interrupt `0x10` selects VGA text mode `03h`.
4. The screen buffer at `0xB8000` is cleared directly.
5. The first visible character is written to video memory.

This compact loop is the foundation for the project: every next subsystem should
remain inspectable in the same way.

## Roadmap

- [x] Bootable x86 image
- [x] VGA text mode initialization
- [x] Direct write to video memory
- [ ] Text rendering helpers
- [ ] Keyboard input
- [ ] Protected-mode transition
- [ ] Basic graphical framebuffer

## Contributing

This repository is a learning laboratory. Small, focused changes are especially
welcome: keep the boot path clear, explain non-obvious hardware details in code,
and verify with `make run` before opening a pull request.

---

Built to make the path from bare metal to a graphical system visible.
