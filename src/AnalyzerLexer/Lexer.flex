package AnalyzerLexer;
import static AnalyzerLexer.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
   public String lexeme;
%}
%%
Receipt.MethodReceipt | Sale.MethodSale | Product.MethodProduct | Customer.MethodCustomer | DELETE | SET |
CreateReceipt | DeleteReceipt | EditReceipt | NewReceipt |
CreateSale | DeleteSale | EditSale | NewSale |
CreateProduct | DeleteProduct | EditProduct | NewProduct |
CreateCustomer | DeleteCustomer |  EditCustomer | NewCustomer |png | jpg |gif  {lexeme=yytext(); return ReservedWords;}
{espacio} {/*Ignore*/}
({L}" "{D}" #"{D}{L}"-"{D})|({L}" "{D}"#"{D}"-"{D}) {lexeme=yytext(); return Address;}
"/" {lexeme=yytext(); return Separating;}
"-" {lexeme=yytext(); return Minus;}
"+" {lexeme=yytext(); return Plus;}
"*" {lexeme=yytext(); return Asterisk;}
"_" {lexeme=yytext(); return Underscore;}
"=" {lexeme=yytext(); return Equal;}
"(" {lexeme=yytext(); return OpenParenthesis;}
")" {lexeme=yytext(); return CloseParenthesis;}
"$" {lexeme=yytext(); return Dollar;}
"%" {lexeme=yytext(); return Percent;}
"," {lexeme=yytext(); return Comma;}
"." {lexeme=yytext(); return Dot;}
"?" {lexeme=yytext(); return QuestionMark;}
";" {lexeme=yytext(); return SemiColon;}
":" {lexeme=yytext(); return Colon;}
"'" {lexeme=yytext(); return SingleQuotes;}
"#" {lexeme=yytext(); return NumberSign;}
({D}"x"{D}) {lexeme=yytext(); return Signature;}
("#"{D})* {lexeme=yytext(); return Identifying;}
("C#"{D})* {lexeme=yytext(); return IdentifyingCustomer;}
("R#"{D})* {lexeme=yytext(); return IdentifyingReceipt;}
("S#"{D})* {lexeme=yytext(); return IdentifyingSale;}
("P#"{D})* {lexeme=yytext(); return IdentifyingProduct;}
({L}|{D})* {lexeme=yytext(); return Word;}
{D}+ {lexeme=yytext(); return Number;}
. {return ERROR;}