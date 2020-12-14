%option yylineno
%{ 	 
#include <math.h> 
%} 
DIGIT 	[0-9] 
ID 		[a-z][a-z0-9]* 

%% 
{DIGIT}+ 	printf( "Integer literal: %d\n", atoi(yytext) ); 
{DIGIT}+"."{DIGIT}*  printf( "Float literal: %g\n", atof(yytext) );  
"if"|"then"|"function"|"end"  printf( "Reserved word: %s\n", yytext );  
{ID} 		printf( "Identifier: %s\n", yytext ); 
"+"|"-"|"="|">" printf( "Operator: %s\n", yytext ); 
[ \t\n]+ 		/* ignore whitespaces */ 
. printf("Error in line %d\n", yylineno);

%% 
int main(int argc, char **argv) { 
    if ( argc > 1 ) 
        yyin = fopen( argv[1], "r" ); 
    else 
        yyin = stdin; 
    yylex(); 
}
