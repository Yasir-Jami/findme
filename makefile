# Authors: Yasir Jami & Cole Doris 

# EXAMPLE USAGE OF GLOBBING: ./findme . -name "*.c"
# If using a glob, name argument must be enclosed in quotes
# Otherwise, name argument is expanded and substituted to the first filename in the current directory that matches the glob
# Quotes are not necessary if you are just looking for a file name (-name main.c is fine)

findme_OBJS:=findmemain.o findme.o 
INC:=-I/../include/

all: findme

CC:=gcc
CFLAGS:=-Wall -pthread

findme: $(findme_OBJS) 
	$(CC) $(CFLAGS) $(INC) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f *.o findme