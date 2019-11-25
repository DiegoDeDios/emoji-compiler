%{
	#include <stdio.h>
    #include <math.h> 
    extern int yylex();
    extern FILE *yyin;
    extern FILE *yyout;
    extern char* str_bft;
    extern char* result;
    extern char* emojify();
%}

%union {
    char* str_ptr;
}
%type <str_ptr> prog
%type <str_ptr> sntc
%type <str_ptr> someone
%type <str_ptr> amplificador
%type <str_ptr> nonpersonal
%type <str_ptr> destination
%type <str_ptr> doActivity
%type <str_ptr> activity
%type <str_ptr> basic
%token <str_ptr> PRONOUN VERB CONJUNCION ADJECTIVE VERBOID PREPOSITION POSSESIVEPRONOUN INTERROGATIVE ARTICLE NOUN INTERJECTION QUESTION
%%
    prog: sntcs {  }
    sntcs: sntc {}
    |
        ;
    sntc: basic {}
    | someone {}
    ;
    basic: PRONOUN VERB amplificador { 

     }
            | PRONOUN nonpersonal {  }
            | PRONOUN VERB PRONOUN amplificador { 
                if(strcmp($2,"love") == 0) {     
                result = emojify (str_bft,"love","\U00002764");
                } 
            }
            | PRONOUN nonpersonal NOUN {  }
            | PRONOUN nonpersonal destination NOUN { 
                if(strcmp($4,"movies") == 0) {     
                    result = emojify (str_bft,"movies","\U0001F4FD");
                } 
             }
            | PRONOUN nonpersonal amplificador NOUN {  }
            | PRONOUN nonpersonal ADJECTIVE destination NOUN { }
            ;
    someone: POSSESIVEPRONOUN NOUN VERB doActivity { 
        if(strcmp($3,"likes") == 0) { 
            result = emojify (str_bft,"likes","\U0001F44D");
            } 
        }
            ;
    doActivity: PREPOSITION VERBOID activity {

            }
             | activity { 

              }
            ;
    activity: ARTICLE NOUN { 
        if(strcmp($2,"piano") == 0) { 
            result = emojify (str_bft,"piano","\U0001F3B9");
            str_bft = result;
            } 
        if(strcmp($2,"guitar") == 0) { 
            result = emojify (str_bft,"guitar","\U0001F3B8");
            str_bft = result;
            }
     }
             | NOUN {
            if(strcmp($1,"soccer") == 0) { 
                result = emojify (str_bft,"soccer","\U000026BD");
                str_bft = result;
                }
            if(strcmp($1,"tennis") == 0) { 
                result = emojify (str_bft,"tennis","\U0001F94E");
                str_bft = result;
                }
            if(strcmp($1,"basketball") == 0) { 
                result = emojify (str_bft,"basketball","\U0001F3C0");
                str_bft = result;
                }
            if(strcmp($1,"chess") == 0) { 
                result = emojify (str_bft,"chess","\U0000265F");
                str_bft = result;
                }           
              }
             | ADJECTIVE { 
            if(strcmp($1,"sad") == 0) { 
                result = emojify (str_bft,"sad","\U0001F622");
                }  
             }
            ;
    amplificador: CONJUNCION ADJECTIVE { 
        if(strcmp($2,"cool") == 0) {     
            result = emojify (str_bft,"cool","\U0001F976");
            str_bft = result;
            } 
    }
            ;
    nonpersonal: VERB VERBOID {
        if(strcmp($2,"going") == 0) {     
            result = emojify (str_bft,"going","\U0001F3C3");
            str_bft = result;
            }
         if(strcmp($2,"swimming") == 0) {     
            result = emojify (str_bft,"swimming","\U0001F3CA");
            str_bft = result;
            }
        if(strcmp($1,"went") == 0) {     
            result = emojify (str_bft,"went","\U000027A1");
            str_bft = result;
            }
    }
            ;
    destination: PREPOSITION ARTICLE
            ;
    
%%

