all: analyzer

analyzer.tab.h analyzer.tab.c: analyzer.y
	bison -t -v -d analyzer.y

lex.yy.c: analyzer.l analyzer.tab.h
	flex analyzer.l

analyzer: lex.yy.c analyzer.tab.c analyzer.tab.h sym_tab.c sym_tab.h asm_tab.c asm_tab.h
	gcc -o analyzer analyzer.tab.c lex.yy.c sym_tab.c asm_tab.c

clean: analyzer analyzer.tab.h analyzer.tab.c lex.yy.c analyzer.output
	rm analyzer analyzer.tab.h analyzer.tab.c lex.yy.c analyzer.output

test: all
	cat ex.c | ./analyzer

test_tab: sym_tab.c sym_tab.h test_sym_tab.c
	gcc -o test_sym_tab sym_tab.c test_sym_tab.c

clean_test_tab: test_sym_tab
	rm test_sym_tab