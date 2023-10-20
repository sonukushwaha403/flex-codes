%{
    #include <stdio.h>
%}

DIGIT [0-9]
ALPHA [a-zA-Z]
WS [ \t\n]

%%

{DIGIT}+    { printf("Integer: %s\n", yytext); }
{ALPHA}+    { printf("String: %s\n", yytext); }
{DIGIT}+"."{DIGIT}+    { printf("Float: %s\n", yytext); }
{WS}+    { /* ignore whitespace */ }

%%

int main(int argc, char** argv) {
    yylex();
    return 0;
}

