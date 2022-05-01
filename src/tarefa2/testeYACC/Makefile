all:
	flex teste.l
	bison -d teste.y
	gcc -o teste lex.yy.c teste.tab.c -ll