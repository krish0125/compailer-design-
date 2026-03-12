%{
#include<stdio.h>
#include<stdlib.h>

int sc=0,wc=0,lc=0,cc=0;
%}

%%

\n              { lc++; cc+=yyleng; }
[ \t]           { sc++; cc+=yyleng; }
[^\t\n ]+       { wc++; cc+=yyleng; }

%%

int main(int argc ,char* argv[])
{
    if(argc==2)
    {
        yyin=fopen(argv[1],"r");
    }
    else
    {
        printf("Enter the input:\n");
        yyin=stdin;
    }

    yylex();

    printf("Number of lines = %d\n",lc);
    printf("Number of spaces = %d\n",sc);
    printf("Number of words = %d\n",wc);
    printf("Number of characters = %d\n",cc);

    return 0;
}

int yywrap()
{
    return 1;
}