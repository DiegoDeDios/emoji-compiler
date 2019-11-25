%{
        #include <stdio.h>
        #include "y.tab.h"
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
we { yylval.str_ptr = strdup (yytext);  return PRONOUN;}
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
hate |
hates |
drive { yylval.str_ptr = strdup (yytext); return VERB;}
so { return CONJUNCION; }
much |
cool |
late |
sunny |
rainny |
windy |
weird |
sad |
happy {  yylval.str_ptr = strdup (yytext);  return ADJECTIVE; }
going |
freezing |
go | 
making | 
running | 
acting |
play | 
swimming { yylval.str_ptr = strdup (yytext); return VERBOID; } 
to | 
in | 
on { yylval.str_ptr = strdup (yytext);  return PREPOSITION; }
My | 
my | 
his | 
her {yylval.str_ptr = strdup (yytext);  return POSSESIVEPRONOUN; }
How | 
Where | 
Why | 
Can | 
how | 
where | 
why | 
can { yylval.str_ptr = strdup (yytext);  return INTERROGATIVE;}
The | 
the { yylval.str_ptr = strdup (yytext); return ARTICLE; }
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
sister |
father |
mother |
dad |
mom |
today |
piano |
guitar |
soccer |
tennis |
chess |
basketball |
airport { yylval.str_ptr = strdup (yytext);  return NOUN; }
Welcome |
Hello { yylval.str_ptr = strdup (yytext); return INTERJECTION;  }
\? { yylval.str_ptr = strdup (yytext); return QUESTION; }
%%

char *emojify (char *sentence, char *find, char *replace)
{
    char *dest = malloc (strlen(sentence)-strlen(find)+strlen(replace)+1);
    char *destptr = dest;

    *dest = 0;

    while (*sentence)
    {
        if (!strncmp (sentence, find, strlen(find)))
        {
            strcat (destptr, replace);
            sentence += strlen(find);
            destptr += strlen(replace);
        } else
        {
            *destptr = *sentence;
            destptr++;
            sentence++;
        }
    }
    *destptr = 0;
    return dest;
}
char* str_bft;
char* result;
int main(int argc, const char* const argv[])
{
    str_bft = "They went swimming";

    YY_BUFFER_STATE bufferState = yy_scan_string(str_bft);

    // This is a flex source. For yacc/bison use yyparse() here ...    
    yyparse();
    // Do not forget to tell flex to clean up after itself. Lest
    // ye leak memory.
    yy_delete_buffer(bufferState);
    printf ("%s\n", result);

    return (EXIT_SUCCESS);
}