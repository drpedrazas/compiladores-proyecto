%{ 
    #include"y.tab.h" 
    #include<math.h> 
    #include <stdio.h>
%}

%% 

[0-9]+ {yylval.real=atof(yytext);return TKNUM;} 

[+]     {return '+';} 

[-]     {return '-';} 

[*]     {return '*';} 

[/]     {return '/';} 

[\^]    {return '^';}

"sen"   {return TKSEN;} 

"cos"   {return TKCOS;} 

"tan"   {return TKTAN;} 

"log"  {return TKLOG;} 

"sqrt"  {return TKSQRT;}

"PI"    {return TKPI;}

"e"     {return TKE;}

[\t]+   ;

" "     { }

[\n]    {return 0;} 

.       {return yytext[0]; } 

%% 
