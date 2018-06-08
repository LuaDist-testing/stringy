LUA_CFLAGS=`pkg-config lua5.1 --cflags`

all: stringy.so

stringy.so: stringy.c stringy_test.lua
	gcc $(LUA_CFLAGS) -O3 -fPIC -o stringy.o -c stringy.c
	gcc -shared -O3 stringy.o -o stringy.so
	lua stringy_test.lua

clean:
	rm stringy.so stringy.o
