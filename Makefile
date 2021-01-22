# @author: David Brousseau

CFLAGS = -std=c99 -pedantic -W -Wall

.PHONY: default memcheck clean
.SILENT: doc memcheck

default: cat concat

bin:
	mkdir -p $@

cat: bin
	gcc src/cat.c -g $(CFLAGS) -o bin/$@

concat: bin
	gcc src/concat.c -g $(CFLAGS) -o bin/$@

doc:
	mkdir -p $@
	(cat Doxyfile 2> doxygen.log;\
	echo 'GENERATE_LATEX=NO';\
	echo 'HAVE_DOT=NO';\
	echo 'OPTIMIZE_OUTPUT_FOR_C=YES';\
	echo 'OUTPUT_DIRECTORY=$@';\
	echo 'PROJECT_NAME="Cat & Concat"';\
	echo 'RECURSIVE=YES') | doxygen - >> doxygen.log
	ln -rsf $@/html/index.html $@/index.html

memcheck: default
	# Concat exercise
	echo 'abc' > tmp1
	echo '123' > tmp2
	valgrind --leak-check=full \
	--show-leak-kinds=all \
	--track-origins=yes \
	--verbose \
	--log-fd=9 9>valgrind.log \
	bin/concat tmp1 tmp2 tmp > /dev/null
	# Cat exercise
	valgrind --leak-check=full \
	--show-leak-kinds=all \
	--track-origins=yes \
	--verbose \
	--log-fd=9 9>>valgrind.log \
	bin/cat tmp > /dev/null
	rm tmp*

clean:
	rm -rf bin doc *.log
