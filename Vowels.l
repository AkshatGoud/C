%{
    #include <stdio.h>
%}
%%
[aeiouAeiou] { printf("Vowel\n",yytext);}
[a-zA-Z] { printf("Consonant\n",yytext);}

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