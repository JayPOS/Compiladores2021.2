1:
	flex ./src/tarefa1/teste.l
	bison -d ./src/tarefa1/teste.y
	gcc -o teste ./src/tarefa1/lex.yy.c ./src/tarefa1/teste.tab.c -ll