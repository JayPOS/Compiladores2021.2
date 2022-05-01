%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "op.tab.h"
int showError();
void yyerror(char *s);

%}

%%

[a-z]+              {
                        sscanf(yytext, "%s", yylval.name);
                        return VAR;
                    }

([0-9]+([\.][0-9]+)?)    {
                                sscanf(yytext, "%f", &yylval.number);
                                return NUM;
                            }

[-+()=/*\^\n]             return *yytext;


[ \t]              ;


.                   {
                        showError();
                        yyerror("invalid character");
                    }

%%


int yywrap(void) {
    return 1;
}

int showError() {
    printf("Input cannot be used in calculator\n");
}