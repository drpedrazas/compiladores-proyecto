%{
    #include<stdio.h> 
%} 

%token id "id" 
%token if "if" 
%token else "else"
%token then "then"
%token inst "inst"
%right "then" "else"

%% 




start: Z {printf("%d\n",$$);} 

Z: S; 
S: if E then S else S
| if E then S
| inst;
E: id;





%% 

main() 
{ 
    printf("INGRESE EXPRESION\n"); 

    if(yyparse()==0) 
        printf("TERMINADO\n"); 
} 

yywrap()
{
} 

yyerror() 
{ 
    printf("ERROR\n"); 
}
