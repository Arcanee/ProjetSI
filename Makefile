all: analyzer

analyzer.tab.h analyzer.tab.c: analyzer.y
	bison -t -v -d analyzer.y

lex.yy.c: analyzer.l analyzer.tab.h
	flex analyzer.l

analyzer: lex.yy.c analyzer.tab.c analyzer.tab.h
	gcc -o analyzer analyzer.tab.c lex.yy.c tabSymbole.c

clean:
	rm analyzer analyzer.tab.h analyzer.tab.c lex.yy.c analyzer.output

test: all
	cat ex.c | ./analyzer