all:
	flex op.l
	bison -d op.y -Wconflicts-rr
	gcc -o op lex.yy.c op.tab.c -ll -lm

justC:
	gcc -o op lex.yy.c op.tab.c -ll -lm

justLex:
	flex op.l

justYacc:
	bison -d op.y
