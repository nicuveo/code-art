elf-quine: elf-quine.asm
	nasm -f bin $< -o $@
	chmod +x $@

elf-quine-base.png: elf-quine
	runhaskell bin-to-hsi.hs

clean:
	rm -f elf-quine elf-quine-base.png
