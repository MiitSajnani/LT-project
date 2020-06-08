%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
[0-2][0-9]|[0-2][0-9]"."[0-5][0-9] {
	yylval.real=(float)atof(yytext);
	return NUM;
}
[a] {yylval.real=1.0; return A;}
[b] {yylval.real=1.0; return B;}
[c] {yylval.real=1.0; return C;}
[d] {yylval.real=1.0; return E;}
[e] {yylval.real=1.0; return F;}
convert {return convert;}
to {return to;}
[\n] {return yytext;}
[/t] ;
%%
int yywrap() {return 1;}
