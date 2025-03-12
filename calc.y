%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    float fval;
}

%token <fval> NUMBER
%token ADD MUL SIN COS ASIN ACOS LPAREN RPAREN END

%type <fval> expr term factor function

%%

calculation:
    expr END { printf("Result: %.2f\n", $1); }
    ;

expr:
    expr ADD term { $$ = $1 + $3; }
    | term { $$ = $1; }
    ;

term:
    term MUL factor { $$ = $1 * $3; }
    | factor { $$ = $1; }
    ;

factor:
    NUMBER { $$ = $1; }
    | function { $$ = $1; }
    | LPAREN expr RPAREN { $$ = $2; }
    ;

function:
    SIN LPAREN expr RPAREN { $$ = sin($3); }
    | COS LPAREN expr RPAREN { $$ = cos($3); }
    | ASIN LPAREN expr RPAREN { $$ = asin($3); }
    | ACOS LPAREN expr RPAREN { $$ = acos($3); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}