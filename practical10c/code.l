%{
#include <stdio.h>

int line_number = 1;
%}

%%

.*\n    { printf("%10d %s", line_number++, yytext); }

%%

int yywrap()
{
    return 1;
}

int main(int argc, char *argv[])
{
    extern FILE *yyin;

    yyin = fopen("input.txt","r");

    if(yyin == NULL)
    {
        printf("Cannot open file\n");
        return 0;
    }

    yylex();

    return 0;
}