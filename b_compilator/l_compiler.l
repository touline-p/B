%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

int col = 1;          /* colonne courante */
int tok_col; 

#define YY_USER_ACTION \
    tok_col = col;     \
    col += yyleng;
%}

IDENTIFIER_CHAR [a-zA-Z_.]
NUMBER [0-9]
WHITESPACE [ \t\v\r\f]

IDENTIFIER {IDENTIFIER_CHAR}({IDENTIFIER_CHAR}|{NUMBER}){0,3}
LONG_IDENTIFIER {IDENTIFIER_CHAR}({IDENTIFIER_CHAR}|{NUMBER}){0,9}
TOO_LONG_IDENTIFIER {IDENTIFIER_CHAR}({IDENTIFIER_CHAR}|{NUMBER})*

%%
{NUMBER}+    { printf("nb[%s] ", yytext); yylval.ival = atoi(yytext); return NB; }
"+"          { printf("PLUS "); return PLUS; }
"-"          { printf("MINUS "); return MINUS; }
"="          { printf("EQUAL "); return EQUAL; }
"*"          { printf("ASTE "); return ASTE; }
"/"          { printf("SLASH "); return SLASH; }
"%"          { printf("PERCENT "); return PERCENT; }
"("          { printf("O_PAR "); return O_PAR; }
")"          { printf("C_PAR "); return C_PAR; }
"\""         { printf("D_QUOTES "); return D_QUOTES; }
"\'"         { printf("S_QUOTES "); return S_QUOTES; }
"["          { printf("O_BRACKET "); return O_BRACKET; }
"]"          { printf("C_BRACKET "); return C_BRACKET; }
"{"          { printf("O_CURLY_BRACKET "); return O_CURLY_BRACKET; }
"}"          { printf("C_CURLY_BRACKET "); return C_CURLY_BRACKET; }
","          { printf("COMMA "); return COMMA; }
"."          { printf("PERIOD "); return PERIOD; }
";"          { printf("SEMICOLON "); return SEMICOLON; }

{WHITESPACE} ;
"\n"          { printf("\n"); }

auto 		 { printf("<auto> "); return AUTO; }
extern		 { printf("<extrn> "); return EXTRN; }
if		     { printf("<if> "); return IF; }
else		 { printf("<else> "); return ELSE; }
for		     { printf("<for> "); return FOR; }
while		 { printf("<while> "); return WHILE; }
repeat		 { printf("<repeat> "); return REPEAT; }
switch		 { printf("<switch> "); return SWITCH; }
do		     { printf("<do> "); return DO; }
return		 { printf("<return> "); return RETURN; }
break		 { printf("<break> "); return BREAK; }
goto		 { printf("<goto> "); return GOTO; }
next		 { printf("<next> "); return NEXT; }
case		 { printf("<case> "); return CASE; }
default		 { printf("<default> "); return DEFAULT; }

{IDENTIFIER}	{	printf("ID[%s] ", yytext); yylval.sval = strdup(yytext); return ID;}
{LONG_IDENTIFIER}	{	printf("LONG_ID[%s] ", yytext);yylval.sval = strdup(yytext); return LONG_ID;}
{TOO_LONG_IDENTIFIER} {	printf("TOO_LONG_IDENTIFIER[%s] ", yytext);yylval.sval = strdup(yytext); return TOO_LONG_ID;} 
