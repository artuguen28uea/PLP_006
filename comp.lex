%{
    /* Analisador lexical básico */
%}

NUMERO              (([0-9]+(\.[0-9]))|[0-9])
IDENTIFICADOR       (([a-zA-Z][a-zA-Z0-9]+)|[a-zA-Z]+)
BRANCO              [ ]
TABULACAO           [\n\t]
ARITMETICO          [+|-|*|/]{1}
ATRIBUICAO          [=]{1}
DELIMITADOR         [;|,]{1}

%%

{NUMERO}            printf("Um numero foi detectado: \"%s\"\n", yytext);
{IDENTIFICADOR}     printf("Um identificador foi detectado: \"%s\"\n", yytext);
{BRANCO}            printf("Um espaço em branco foi detectado: \"%s\"\n", yytext);
{ARITMETICO}        printf("Um operador aritmético foi detectado: \"%s\"\n", yytext);
{DELIMITADOR}       printf("Um delimitador foi detectado: \"%s\"\n", yytext);
{ATRIBUICAO}        printf("Um operador de atribuicao foi detectado: \"%s\"\n", yytext);
{TABULACAO}         printf("Uma tabulação foi detectada: \"%s\"\n", yytext);
%%

int main(int argc, char *argv[])
{
    if(argc < 2)
    {
        printf("Missing input file\n"); exit(-1);
    }
    yyin = fopen(argv[1], "r");
    yylex();
}