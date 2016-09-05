%{
#include <cstdio>
#include <iostream>
using namespace std;

// stuff from flex that bison needs to know about:
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *s);
%}

%union {
    int ival;
    float fval;
    char *sval;
}

// define the constant-string tokens:
%token PROGRAM   
%token IF        
%token ID        
%token COLON     
%token VAR       
%token COMMA     
%token O_BRACKET 
%token C_BRACKET 
%token PRINT     
%token GREATER   
%token LESSER    
%token IS_EQUAL  
%token EQUALS    
%token PLUS      
%token MINUS     
%token MULT      
%token DIVISION  
%token O_PARENT  
%token C_PARENT  
%token L_CONSTANT
%token F_CONSTANT

// define the "terminal symbol" token types I'm going to use (in CAPS
// by convention), and associate each with a field of the union:
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%%
// this is the actual grammar that bison will parse, but for right now it's just
// something silly to echo to the screen what bison gets from flex.  We'll
// make a real one shortly:

program:
    program_init vars bloque { cout << "Matched ProgramInit Vars Bloque" << endl; } 
program:
    program_init bloque  { cout << "Matched ProgramInit Bloque" << endl; } 
program:
    program_init { cout << "Matched ProgramInit" << endl; } 
program_init:
    PROGRAM ID COLON

vars:
    VAR


bloque:
    O_PARENT C_PARENT
%%

int main(int, char**) {

	yyparse();

}

void yyerror(const char *s) {
	cout << "EEK, parse error!  Message: " << s << endl;
	// might as well halt now:
	exit(-1);
}