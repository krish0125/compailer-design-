%{
#include <stdio.h>

int tags = 0;
FILE *yyin;

%}

%%

"<"[^>]*">"      { tags++; printf("%s\n", yytext); }

.|\n             { }

%%

int yywrap(void)
{
    return 1;
}

int main()
{
    FILE *f;
    char file[50];

    printf("Enter File Name: ");
    scanf("%s", file);

    f = fopen(file, "r");

    if (f == NULL)
    {
        printf("Cannot open file\n");
        return 0;
    }

    yyin = f;

    yylex();

    printf("\nNumber of HTML tags: %d\n", tags);

    fclose(f);

    return 0;
}