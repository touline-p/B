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
{NUMBER}+    {  yylval.ival = atoi(yytext); return NB; }

"+"          {  return PLUS; }
"-"          {  return MINUS; }
"<"          {  return S_INF; }
">"          {  return S_SUP; }
"="          {  return ASSIGN; }
">="         {  return SUP; }
"<="         {  return INF; }
"=="         {  return EQUAL; }
"!="         {  return NOT_EQUAL; }
"*"          {  return ASTE; }
"/"          {  return SLASH; }
"%"          {  return PERCENT; }
"("          {  return O_PAR; }
")"          {  return C_PAR; }
"\""         {  return D_QUOTES; }
"\'"         {  return S_QUOTES; }
"["          {  return O_BRACKET; }
"]"          {  return C_BRACKET; }
"{"          {  return O_CURLY_BRACKET; }
"}"          {  return C_CURLY_BRACKET; }
","          {  return COMMA; }
"."          {  return PERIOD; }
";"          {  return SEMICOLON; }

{WHITESPACE} ;
"\n"          {  }

auto 		 {  return AUTO; }
extern		 {  return EXTRN; }
if		     {  return IF; }
else		 {  return ELSE; }
for		     {  return FOR; }
while		 {  return WHILE; }
repeat		 {  return REPEAT; }
switch		 {  return SWITCH; }
do		     {  return DO; }
return		 {  return RETURN; }
break		 {  return BREAK; }
goto		 {  return GOTO; }
next		 {  return NEXT; }
case		 {  return CASE; }
default		 {  return DEFAULT; }

{IDENTIFIER}	        {	yylval.sval = strdup(yytext); return ID;}
{LONG_IDENTIFIER}	    {	yylval.sval = strdup(yytext); return LONG_ID;}
{TOO_LONG_IDENTIFIER}   {	yylval.sval = strdup(yytext); return TOO_LONG_ID;} 
