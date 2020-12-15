# @author: David Brousseau

CFLAGS = -std=c99 -pedantic -W -Wall

.PHONY: all clean

default: cat concat

bin:
	mkdir -p $@

cat: bin
	gcc src/cat.c -g $(CFLAGS) -o bin/cat

concat: bin
	gcc src/concat.c -g $(CFLAGS) -o bin/concat

doc:
	mkdir -p $@
	(cat Doxyfile ; echo "GENERATE_LATEX=NO";\
	echo "OPTIMIZE_OUTPUT_FOR_C=YES";\
	echo "OUTPUT_DIRECTORY="$@;\
	echo "OUTPUT_LANGUAGE=French";\
	echo "PROJECT_NAME=Cat et Concat";\
	echo "RECURSIVE=YES") | doxygen -
	ln -rsf $@/html/index.html $@/index.html

clean:
	rm -rf bin doc
