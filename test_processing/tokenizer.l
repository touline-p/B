%{
#include <stdio.h>
#include "tokenizer.tab.h"
%}
 
STRING [a-zA-Z]+

%%
 
set       return SET;
state     return STATE;
mode      return MODE;
get       return GET;
{STRING} { yylval=strdup(yytext); return STRING; }
