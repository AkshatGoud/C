%{
    #include <stdio.h>
    int count = 0;
%}

%%

.   { count++; }  // Match any character and increment count
\n  { count++; }  // Count newlines as well

%%

int main() {
    printf("Enter text (Press CTRL+D to stop input):\n");
    yylex();
    printf("\nTotal number of characters: %d\n", count);
    return 0;
}

// Properly handle end of input
int yywrap() {
    return 1;
}