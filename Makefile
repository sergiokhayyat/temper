# Makefile for temperature reader
CC=gcc
CFLAGS=-Wall

all: temper temper_json

temper: temper.c pcsensor.c pcsensor.h
	$(CC) $(CFLAGS) temper.c pcsensor.c -o temper -lusb

temper_json: temper_json.c pcsensor.c pcsensor.h
	$(CC) $(CFLAGS) temper_json.c pcsensor.c -o temper_json -lusb

clean:
	rm temper temper_json

install:
	install temper /usr/local/bin

uninstall:
	rm -f /usr/local/bin/temper
