%{
    #include <stdio.h>
%}

%%
[a-z] {printf("%s is Lowercase\n",yytext);}
[A-Z] {printf("%s is Uppercase\n",yytext);}
%%
int main()
{
    printf("Enter a character: ");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}