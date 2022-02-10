%{
    #include<stdio.h> 
    #include<math.h>
    #define PI 3.1416
%} 

%union
{
 float real;
}

%token <real> TKNUM 
%token TKSEN
%token TKCOS
%token TKTAN
%token TKSQRT
%token TKLOG
%token TKE
%token TKPI
%left '-''+' 
%left '*''/' 
%right '^'

%type <real> exp
%type <real> inicio

%% 
inicio: exp {printf("%f\n",$$);} 

exp:exp'-'exp           {$$ = $1-$3;} 
    |exp'+'exp          {$$ = $1+$3;} 
    |exp'*'exp          {$$ = $1*$3;} 
    |exp'/'exp          { 
                            if($3 == 0){  
                            
                                yyerror("ERROR"); 
                                YYERROR;
                                
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
                                yyerror("ERROR"); 
                                YYERROR;
                            }else{ 
                            
                                $$ = tan($3); 
                                
                            }
                        }
                        
    |TKLOG'('exp')'    {
                            if($3 <= 0){  
                            
                                yyerror("ERROR"); 
                                YYERROR;
                                
                            }else{ 
                            
                                $$ = log($3); 
                                
                            }
                        }
                        
                        
                        
    |TKE'('exp')'      {$$ = exp($3);}
    |TKSQRT'('exp')'   {
                            if($3 < 0){  
                            
                                yyerror("ERROR"); 
                                
                                YYERROR;
                                
                            }else{ 
                            
                                $$ = sqrt($3); 
                                
                            }
                        }
                        
                        
                        
    |TKNUM             {$$ = $1;} 
    |TKPI              {$$ = PI;}
    ; 

%% 

main() 
{ 
    printf("ENTRE EXPRESION:\n"); 

    if(yyparse()==0) {
        
        
        printf("TERMINADO\n"); 
        
        
        }
} 

yywrap()
{
} 

yyerror() 
{ 

    printf("ERROR\n"); 
    
    
    return 0;
}
