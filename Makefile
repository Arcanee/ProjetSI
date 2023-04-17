all: analyzer

analyzer.tab.h analyzer.tab.c: analyzer.y
	bison -t -v -d analyzer.y

lex.yy.c: analyzer.l analyzer.tab.h
	flex analyzer.l

analyzer: lex.yy.c analyzer.tab.c analyzer.tab.h tabSymbole.c tabSymbole.h asm_tab.c asm_tab.h
	gcc -o analyzer analyzer.tab.c lex.yy.c tabSymbole.c asm_tab.c

clean:
	rm analyzer analyzer.tab.h analyzer.tab.c lex.yy.c analyzer.output test_tabSymbole

test: all
	cat ex.c | ./analyzer

test_tab: tabSymbole.c tabSymbole.h test_tabSymbole.c
	gcc -o test_tabSymbole tabSymbole.c test_tabSymbole.c