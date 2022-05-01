%{

#include <stdio.h>
#include "teste.tab.h"
void showError();

%}

numbers     ([0-9])+
word    ([a-zA-Z])+

%%

{word}      {sscanf(yytext, "%s", yylval.name); return (STRING);}
{numbers}   {yylval.number = atoi(yytext); return (NUM);}
";"         {return (SEMICOLON);}
.           {showError(); return (OTHER);}

%%

void showError()
{
    printf("Other input\n");
}