%{
    #include <stdio.h>
%}

%%

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" { printf("Keyword: %s\n", yytext); }
[0-9]+ { printf("Number: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[-+*/%] { printf("Operator: %s\n", yytext); }
[ \t\n] { /* ignore whitespace */ }
. { printf("Lexical error: Unrecognized character: %c\n", yytext[0]); }

%%

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Please provide a file name as an argument.\n");
        return 1;
    }
    FILE* file = fopen(argv[1], "r");
    if (!file) {
        printf("Failed to open file.\n");
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
