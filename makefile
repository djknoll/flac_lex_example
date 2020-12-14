simple : simple.yy.c
	gcc -ll -o simple simple.yy.c

simple.yy.c : simple.l
	lex -o simple.yy.c simple.l

