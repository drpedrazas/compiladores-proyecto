%{ 
    #include"y.tab.h" 
    #include<math.h> 
    #include <stdio.h>
    #include <stdlib.h>
    int nlines=0;
%}

%% 


[0-9]+  {yylval=atof(yytext);return TK_NUM;} 

[+]     {return '+';} 

[-]     {return '-';} 

[*]     {return '*';} 

[/]     {return '/';} 

[\^]    {return '^';}

"PI"    {return TKPI;}

"sen"   {return TKSEN;} 

"cos"   {return TKCOS;} 

"tan"   {return TKTAN;} 

"log"   {return TKLOG;} 

"sqrt"  {return TKSQRT;} 

"e"     {return TKE;}

[A-Za-z]+ {return TID;}

"="     {return '=';}

";"     {return ';';}

[\t]+   ;

" "     { }

[\n]   {return 0;}

.      

%% 
