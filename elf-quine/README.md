## ELF quine

Despite its name, "ELF quine" isn't really a quine. A commonly accepted definition for a quine is "a program that produces a copy of its own source code as its only output" ([Wikipedia](https://en.wikipedia.org/wiki/Quine_(computing))). This project was the result of an attempt to push this idea a bit further: a program that prints... itself. Its own binary.

The result is `elf-quine.asm`: a 159 bytes program that is almost nothing more than the ELF64 header. It would be possible to make it even smaller, by moving some of the code to the unused seven bytes of the `e_ident` part of the header... But instead, here, those seven bytes are filled with ` quine `.

It is hard to visualize the resulting binary; my idea was to make an image out of it, by associating an [HSI](https://en.wikipedia.org/wiki/HSL_and_HSV) value to each byte. The result is `elf-quine.png`: a slightly edited version of the result.

![ELF quine](elf-quine.png?raw=true "ELF quine")
