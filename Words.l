%{
    #include <stdio.h>
    int count = 0;    
%}

%%
[\t\n]+ ;
[a-zA-Z]+ { count++; }
%%
int main()
    {
        printf("Enter text (Press CTRL+D to stop input):\n");
        yylex();
        printf("\nTotal number of words: %d\n", count);
        return 0;
    }
int yywrap()
    {
        return 1;
    }
