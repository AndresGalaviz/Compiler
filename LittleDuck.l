%{
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()

#include "LittleDuck.tab.h"  // to get the token types that we return

%}
%%
[ \t\n]         ;
program         { return PROGRAM;       }
if              { return IF;            }
id              { return ID;            }
:               { return COLON;         }
var             { return VAR;           }
,               { return COMMA;         }
\{              { return O_BRACKET;     }
\}              { return C_BRACKET;     }
print           { return PRINT;         }
\>              { return GREATER;       }
\<              { return LESSER;        }
\<>             { return IS_EQUAL;      }
\=              { return EQUALS;        }
\+              { return PLUS;          }
\-              { return MINUS;         }
\*              { return MULT;          }
\/              { return DIVISION;      }
\(              { return O_PARENT;      }
\)              { return C_PARENT;      }
\cte_l          { return L_CONSTANT;    }
\cte_f          { return F_CONSTANT;    }
[0-9]+\.[0-9]+  { yylval.fval = atof(yytext); return FLOAT;     }
[0-9]+          { yylval.ival = atoi(yytext); return INT;       }
[a-zA-Z0-9]+    { 
    yylval.sval = strdup(yytext);
    return STRING;                      }
 .                ;
%%