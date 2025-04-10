/* 
 * Definição: seção para código do usuário. 
 */

 import token.Token;

%%
/* 
 * Opções e Declarações: seção para diretivas e macros. 
 */

// Diretivas:
%standalone         // Execução independente do analisador sintático.
%line               // Permite usar yyline.
%column             // Permite usar yycolumn.
%class Scanner      // Troca o nome da classe Yylex para Scanner.

%{
  Token token;
%}

// Macros:
BRANCO = [\n| |\t|\r]
PONTOEVIRGULA = ";"
VIRGULA = ","
ABREPARENTESE = "("
FECHAPARENTESE = ")"
ABRECHAVES = "{"
FECHACHAVES = "}"
MENORIGUAL = "<="
ADICAOATRIBUICAO = "+="
ATRIBUICAO = "="
CONTADOR = "++"
INTEIRO = 0|[1-9][0-9]*
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*

%%

/*  
 * Regras e Ações Associadas: seção de instruções para
 * o analisador léxico. 
 */
{ABREPARENTESE}  { token = new Token(yyline, yycolumn, yytext(), "Abre parêntese"); token.imprimir(); }
{FECHAPARENTESE} { token = new Token(yyline, yycolumn, yytext(), "Fecha parêntese"); token.imprimir(); }
{ABRECHAVES}     { token = new Token(yyline, yycolumn, yytext(), "Abre chaves"); token.imprimir(); }
{FECHACHAVES}    { token = new Token(yyline, yycolumn, yytext(), "Fecha chaves"); token.imprimir(); }
{PONTOEVIRGULA}  { token = new Token(yyline, yycolumn, yytext(), "Ponto e vírgula"); token.imprimir(); }
{VIRGULA}        { token = new Token(yyline, yycolumn, yytext(), "Virgula"); token.imprimir(); }  
{MENORIGUAL}     { token = new Token(yyline, yycolumn, yytext(), "Menor igual "); token.imprimir(); }  
{ADICAOATRIBUICAO} { token = new Token(yyline, yycolumn, yytext(), "Adição e Atribuição"); token.imprimir(); }  
{ATRIBUICAO}     { token = new Token(yyline, yycolumn, yytext(), "Atribuição"); token.imprimir(); }
{CONTADOR}       { token = new Token(yyline, yycolumn, yytext(), "Contador"); token.imprimir(); }  
"int"            { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada int"); token.imprimir(); }
"while"          { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada while"); token.imprimir(); }
"return"         { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada return"); token.imprimir(); }
"printf"         { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada printf"); token.imprimir(); }
{BRANCO}         { token = new Token(yyline, yycolumn, yytext(), "Espaço em branco"); token.imprimir(); }
{ID}             { token = new Token(yyline, yycolumn, yytext(), "Identificador"); token.imprimir(); }
{INTEIRO}        { token = new Token(yyline, yycolumn, yytext(), "Número inteiro"); token.imprimir(); }
.                { token = new Token(yyline, yycolumn, yytext(), "Caracter inválido"); token.dispararExcecao(); }

