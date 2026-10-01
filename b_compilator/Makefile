CC        = gcc
BISON     = bison
FLEX      = flex
LD        = ld

CFLAGS    = -Wall -Wextra
BISONFLAGS = -y -d
TARGET    = b_comp

BFILES    = $(wildcard *.b)
PROGRAMS  = $(BFILES:.b=)

.PHONY: all programs clean fclean re

all: $(TARGET)

$(TARGET): lex.yy.o y.tab.o
	$(CC) -o $@ $^ -lfl

y.tab.c y.tab.h: y_compilator.y
	$(BISON) $(BISONFLAGS) y_compilator.y

lex.yy.c: l_compiler.l y.tab.h
	$(FLEX) l_compiler.l

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

brt0.o: brt0.s
	$(CC) -m32 -c -x assembler brt0.s -o brt0.o

# Compile a B source file (%.b) into a standalone executable (%).
%: %.b $(TARGET) brt0.o
	./$(TARGET) < $<
	test compilation.s = $*.s || mv compilation.s $*.s
	$(CC) -m32 -c $*.s -o $*.o
	$(LD) -m elf_i386 $*.o brt0.o -o $@

programs: $(PROGRAMS)

clean:
	rm -f lex.yy.c y.tab.c y.tab.h y.output *.o

fclean: clean
	rm -f $(TARGET) $(PROGRAMS) $(BFILES:.b=.s)

re: fclean all
