%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void showError();
void isPalin();

%}

token    ([a-zA-Z0-9])+

%%

{token}     {isPalin();}
.           {showError(); exit(1);}

%%

void showError()
{
    printf("Other input\n");
    printf("This program only works for strings composed only of \nletters and numbers (capital included)\nThe program check if the string is a palindrome\n");
}

void isPalin(){
    char string[200];
    sscanf(yytext, "%s", string);
    int len = strlen(string);
    int i;
    for (i = 0; i < len; i++)
    {
        if (i > len-i)
            break;
        else if (string[i] != string[(len-1)-i])
        {
            printf("O token inserido não é um palídromo!");
            return;
        }
    }
    printf("O token inserido é um palídromo, parabéns!!!");
}