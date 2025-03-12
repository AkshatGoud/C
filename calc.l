%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "y.tab.h"
%}

%%

[0-9]+(\.[0-9]+)?  { yylval.fval = atof(yytext); return NUMBER; }
"+"                { return ADD; }
"*"                { return MUL; }
"sin"              { return SIN; }
"cos"              { return COS; }
"asin"             { return ASIN; }
"acos"             { return ACOS; }
"("                { return LPAREN; }
")"                { return RPAREN; }
\n                 { return END; }
[ \t]              ; // Ignore spaces
.                  { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() { return 1; }