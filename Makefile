all:
	lex cs315s18_group4.lex
	yacc cs315s18_group4.yacc
	gcc -o parser y.tab.c