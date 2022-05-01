%{
#include <stdio.h>

int yylex();
int yyerror(char *s);
int analiseNumber(int x, int max_X);

%}

%token STRING NUM OTHER SEMICOLON PIC

%type <name> STRING
%type <number> NUM
%type <name> PIC

%union{
    char name[20];
    int number;
}

%%

prog:
    stmts

stmts:
    | stmt SEMICOLON stmts

stmt:
    STRING {
        printf("Isso é string: %s\n", $1);
    }
    | NUM {
        analiseNumber($1, 10);
    }
    | OTHER {
        printf("Nao foi inserido nem numero nem string\n");
    }

%%

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}
int analiseNumber(int x, int max_X)
{
    if(x > max_X)
    {
        printf("Numero informado é maior que %d\n", max_X);
    }
    else
    {
        printf("Numero informado é menor ou igual que %d\n", max_X);
    }
    return x;
}

int main()
{
    yyparse();
    return 0;
}