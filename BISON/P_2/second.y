%{
    #include "y.tab.h"
    #include<math.h>
    #include <stdio.h>
    #include <stdlib.h>
    #define PI 3.1416
    void yyerror(char *);
    int yylex(void);
    int sym[26];
%} 



%token TK_NUM 
%token TKSEN
%token TKCOS
%token TKTAN
%token TKSQRT
%token TKLOG
%token TKE
%token TKPI
%token TID
%token ';'
%right '='
%left '-''+' 
%left '*''/' 
%right '^'


%% 
start:
    | start line 
    ;

line: exp '\n'            {printf("%d\n", $1); }
    | TID '=' exp '\n'  {sym[$1] = $3;};

exp:exp'+'exp           {$$ = $1+$3;} 
    |exp'-'exp          {$$ = $1-$3;} 
    |exp'*'exp          {$$ = $1*$3;} 
    |exp'/'exp          { 
                            if($3 == 0){  
                                yyerror("INDETERMINADO");
                            }else{ 
                                $$ = $1/$3; 
                            } 
                        } 
    |exp'^'exp          {$$ = pow($1, $3);} 
    |'('exp')'          {$$ = $2;} 
    |TKSEN'('exp')'    {$$ = sin($3);} 
    |TKCOS'('exp')'    {$$ = cos($3);}
    |TKTAN'('exp')'    {  
                            if(fabs(cos($3)) < 0.0001){  
                                yyerror("INDETERMINADO");  
                            }else{ 
                                $$ = tan($3); 
                            }
                        }
    |TKLOG'('exp')'    {
                            if($3 <= 0){  
                                yyerror("INDETERMINADO"); 
                            }else{ 
                                $$ = log($3); 
                            }
                        }
    |TKE'('exp')'      {$$ = exp($3);}
    |TKSQRT'('exp')'   {
                            if($3 < 0){  
                                yyerror("INDETERMINADO"); 
                            }else{ 
                                $$ = sqrt($3); 
                            }
                        }
    |TKPI              {$$ = PI;}
    |TK_NUM             {$$ = $1;} 
    |TID              {printf(sym[$1]);$$ = sym[$1];}
    ; 

%% 

main() 
{ 
    printf("ESCRIBA LA EXPRESION:\n"); 
    if(yyparse() == 0)
        printf("TERMINADO");
    return 0; 
} 

yywrap()
{
} 

yyerror ()
{
    printf("ERROR\n"); 
    return 0;
}
