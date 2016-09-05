bison -d LittleDuck.y
flex LittleDuck.l
g++ -x c++ LittleDuck.tab.c lex.yy.c -lfl -o Little
./Little < input.txt