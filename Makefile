# @author: David Brousseau

.PHONY: all clean

default: cat concat

bin:
	mkdir -p $@

cat: bin
	gcc src/cat.c -g -o bin/cat

concat: bin
	gcc src/concat.c -g -o bin/concat

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
