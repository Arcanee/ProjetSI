analyzer:
	make -C src


test: analyzer
	cat asm_testing/test_file.c | bin/analyzer > asm_testing/asm_output && \
	python3 asm_testing/asm_test.py



.PHONY: clean
clean:
	make clean -C src  \
	&& make clean -C lib/test