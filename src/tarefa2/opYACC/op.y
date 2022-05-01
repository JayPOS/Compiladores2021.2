%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MAX_VARS 50

int yylex();
void yyerror(char *s);

typedef struct variable {
    float value;
    char id[32];
} Variable;
Variable vars[MAX_VARS];

int count_vars;
void create_var(char *id, int value);
int getVarValue(char *s);
int varExists(char *s);

%}

%token NUM VAR
%left '+' '-'
%left '*' '/'
%precedence NEG 
%right '^'

%type <name> VAR
%type <number> expr NUM

%union{
    char name[32];
    float number;
}

%%
prog:
    prog stmt '\n'     
    | prog '\n'
    |
    ;

stmt:
    expr                {printf("%f\n", $1);}
    | error '\n' { yyerrok;}
    | VAR '=' expr      {
                            int var_id = varExists($1);
                            if (sizeof($3) == sizeof(float) || sizeof($3) == sizeof(double))
                            {
                                if (-1 == var_id)
                                {
                                    create_var($1, $3);
                                }
                                else
                                {
                                    vars[var_id].value = $3;
                                }
                            }
                        }
    ;

expr:
    NUM                     {$$ = $1; }
    | VAR                   {$$ = getVarValue($1);}
    | expr '+' expr         {$$ = $1 + $3; }
    | expr '-' expr         {$$ = $1 - $3; }
    | expr '*' expr         {$$ = $1 * $3; }
    | expr '/' expr         {
                                if ($3) $$ = (float)($1 / $3);
                                else {
                                    printf("division by zero\n");
                                    exit(1);
                                }   
                            }
    | '-' expr  %prec NEG    { $$ = -$2;}
    | expr '^' expr         {$$ = pow($1, $3);}
    | '(' expr ')'          {$$ = $2;}


%%

void create_var(char *id, int value)
{
    if (count_vars >= MAX_VARS)
    {
        printf("cannot create more variables\n");
        exit(0);
    }
    strcpy(vars[count_vars].id, id);
    vars[count_vars].value = value;
    printf("new var created!\n");
    count_vars++;
}

int varExists(char *s)
{
    int i;
    // printf("%s\n", s);
    for (i = 0; i <= count_vars; i++)
    {
        if (strcmp(s, vars[i].id) == 0)
        {
            return i;
        }
    }
    return -1;
}

int getVarValue(char *s)
{
    int i;
    for (i = 0; i < count_vars; i++)
    {
        if (strcmp(s, vars[i].id) == 0)
        {
            return vars[i].value;
        }
    }
    printf("var %s is not declared!\n", s);
    return -1;
}

void yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
    printf("invalid command! terminating program\n");
    exit(1);
}

int main()
{
    count_vars = 0;
    yyparse();
    return 0;
}