analyzer: lex.yy.c analyzer.tab.c sym_tab.c asm_tab.c fun_tab.c
	gcc -o ../bin/analyzer analyzer.tab.c lex.yy.c sym_tab.c asm_tab.c fun_tab.c

analyzer.tab.h analyzer.tab.c: analyzer.y
	bison -t -v -d analyzer.y

lex.yy.c: analyzer.l analyzer.tab.h
	flex analyzer.l

.PHONY: clean
clean:
	rm -f ../bin/analyzer ../bin/bin_output ../asm_testing/asm_output analyzer.tab.h analyzer.tab.c lex.yy.c analyzer.output