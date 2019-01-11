/* 
 * Sample Scanner2: 
 * Description: Count the number of characters and the number of lines 
 *              from standard input
 * Usage: (1) $ flex sample2.lex
 *        (2) $ gcc lex.yy.c -lfl
 *        (3) $ ./a.out
 *            stdin> whatever you like
 *	      stdin> Ctrl-D
 * Questions: Is it ok if we do not indent the first line?
 *            What will happen if we remove the second rule?
 */
NUMBER [0-9]+
LETTER [a-z]
	int num_int = 0, num_ops = 0, num_paren = 0, num_eq = 0;
FLOAT [0-9]*\.[0-9]+
SCIENTIFIC [0-9]+[e|E][-|+][0-9]+

%%
{FLOAT}		{
		printf("FLOAT %f ", atof(yytext));
		}
{NUMBER}+	{
		printf("NUMBER %d ", atoi(yytext));
		num_int++;
		}
\n		{
		printf("\n");
		}
"+"		{
		printf("PLUS ");
		num_ops++;
		}
"*"		{
		printf("MULT ");
		num_ops++;        
		}
"-"		{
		printf("MINUS ");
		num_ops++;
		}
"/"		{
		printf("DIV ");
		num_ops++;
		}
"("		{
		printf("L_PAREN");
		num_paren++;
		}
")"		{
		printf("R_PAREN ");
		num_paren++;
		}
"="		{
		printf("EQUALS ");
		num_eq++;
		}
.		{
		printf("Error: Invalid Symbol!\n");
		exit(0);
		}
%%

main()
{
  yylex();
  printf("\n\n Results: NUM INTS: %d\nNUM OPS: %d\nNUM PARENS: %d\nNUM EQUALS: %d\n", num_int, num_ops, num_paren, num_eq);
}

