%{
#include<stdio.h>
#include<math.h>
%}

%union{
int integer;
float real;
}

%token <real> NUM A B C E F
%token convert  D to
%type <real> S F1 F2 F3 F4 F5 T 
%%
S : convert T NUM {$$=(-$2)+$3;
		if(($$)>24)
		{
		if(((float)$$-(int)$$)>0.59)
		{printf(" ans %.2f hours",($$-24+0.40));}
		else
		{printf(" ans %.2f hours",$$-24);}
		}
		else
		{if(($$)<0)
                                          {
		if(((float)$$-(int)$$+24)>0.59)
		{printf(" ans %.2f hours",($$+24-0.40));}
		else
		{printf(" ans %.2f hours",$$+24);}
		}
		else
		{
		if(((float)$$-(int)$$)>0.59)
		{printf(" ans %.2f hours",($$+0.40));}
		else
		{printf(" ans %.2f hours",$$);}
		}
		}
		};
T:A to F1{$$=$1+(-$3);}|B to F2{$$=$1+(-$3);} |C to F3{$$=$1+(-$3);}|E to F4{$$=$1+(-$3);}
|F to F5{$$=$1+(-$3);}
;
F1:A{$$=$1+0;}
|B{$$=$1+(-1.30);}
|C{$$=$1+(-9.30);}
|E{$$=$1+(-4.30);}
|F{$$=$1+(-3.30);}
;

F2:A{$$=$1-(-1.30);}
|B{$$=$1+0;}
|C{$$=$1+(-8.00);}
|E{$$=$1+(-3.00);}
|F{$$=$1+(-2.00);}
;


F3:A{$$=$1-(-9.30);}
|B{$$=$1-(-8.00);}
|C{$$=$1+0;}
|E{$$=$1-(-5.00);}
|F{$$=$1-(-6.00);}
;

F4:A{$$=$1-(-4.30);}
|B{$$=$1-(-3.00);}
|C{$$=$1+(-5.00);}
|E{$$=$1+0;}
|F{$$=$1-(-1.00);}
;


F5:A{$$=$1-(-3.30);}
|B{$$=$1-(-2.00);}
|C{$$=$1+(-6.00);}
|E{$$=$1+(-1.00);}
|F{$$=$1+0;}
;
%% 
void yyerror(char *s){}
int main(int argc,char *argv[])
{
printf("TIME CONVERTION\n");
printf("OPTION AVAILABLE in 24 hour FORMAT\n a)Indian time\n b)Dubai time\n c)canadian time \n d)UK time \n e)Germany time \n");
printf("find your suitable time you want to convert");
printf("for example for converting indian time to dubai time you have to write 'convert a to b 11.5' \n"); 

int n=0;
printf("ENTER NUMBER OF TIMES YOU WANT TO USE THE CONVERTION\n");
scanf("%d\n",&n);
for(int i=0;i<n*2;i++){
yyparse();
}
return 0;
}
