%{
#include <stdio.h>
%}

%%

[ \t\r\n]+           ;   /* ignore whitespace */

"="                  { printf("ASSIGN(=)\n"); }
"+"                  { printf("PLUS(+)\n"); }
"*"                  { printf("TIMES(*)\n"); }
"("                  { printf("LPAREN(()\n"); }
")"                  { printf("RPAREN())\n"); }

[0-9]+               { printf("INT(%s)\n", yytext); }
[a-z][a-z0-9]{0,7}   { printf("ID(%s)\n", yytext); }

.                    { printf("UNKNOWN(%s)\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}

