%{
        #include <stdio.h>
%}

%%
[\t ]+ 
I | 
You |
He |
She |
It |
They |
you |
he |
she |
it |
they |
we { printf("%s: Es Pronoun\n", yytext);}
love |
are |
am |
will |
sucks |
is |
approved |
were |
went |
like |
likes |
drive { printf("%s: Es verbo\n", yytext); }
so { printf("%s: Es conjuncion\n", yytext);}
much |
cool |
late |
sunny |
rainny |
windy |
weird |
sad |
happy { printf("%s: Es adjetivo \n", yytext);  }
going |
freezing |
go | 
making | 
running | 
acting | 
swimming { printf("%s: Es verboide\n", yytext); } 
to | 
in | 
on { printf("%s: Es preposicion\n", yytext); }
My | 
my | 
his | 
her { printf("%s: Es posesivo\n", yytext);}
How | 
Where | 
Why | 
Can | 
how | 
where | 
why | 
can { printf("%s: Es interrogativa\n", yytext); }
The | 
the { printf("%s: Es articulo\n", yytext);  }
movies |
beach |
money |
professor |
party |
day |
world |
dog |
Guadalajara |
brother |
today |
airport {printf("%s: Es Noun\n", yytext);  }
Welcome |
Hello {printf("%s: Es Interjeccion\n", yytext);  }
\? {printf("%s: Es pregunta\n", yytext);  }
%%