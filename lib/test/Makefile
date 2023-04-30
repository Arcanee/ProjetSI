all:
	make clean && make tests

tests: test_sym_tab test_asm_tab test_fun_tab


test_sym_tab: test_sym_tab.c
	gcc -o test_sym_tab test_sym_tab.c ../../src/sym_tab.c

test_asm_tab: test_asm_tab.c
	gcc -o test_asm_tab test_asm_tab.c ../../src/asm_tab.c

test_fun_tab: test_fun_tab.c
	gcc -o test_fun_tab test_fun_tab.c ../../src/fun_tab.c



.PHONY: clean
clean:
	rm -f test_sym_tab test_asm_tab test_fun_tab