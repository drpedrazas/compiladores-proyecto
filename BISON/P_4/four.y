%{
    #include<stdio.h> 
%} 

%token START STOP STR NUM
%%

start : START value STOP {printf("OK");}
;

value : start {printf("ENTRA simple_xml");} 

| STR {printf("ENTRA STR");}

| NUM {printf("ENTRA NUM");}

| value start {printf("value simple_xml");}
;

%% 

main() 
{ 
    printf("ENTRE EXPRESION\n"); 

    if(yyparse()==0) 
        printf("TEMRINADO\n"); 
} 

yywrap()
{
} 

yyerror() 
{ 
    printf("ERROR\n"); 
}
