# Compiler and its flags
CC=gcc
CFLAGS = -std=c99 -pedantic -W -Wall

# Project name
PROJECT_NAME="Cat & Concat"

# All directories
BIN_DIR=bin
DOC_DIR=doc
SRC_DIR=src

# Executable files for both exercices
EXEC_1=cat
EXEC_2=concat

# All log files
DOXYGEN_LOG=doxygen.log
VALGRIND_LOG=valgrind.log

# Documentation index
DOC_INDEX=index.html

.PHONY: default memcheck clean
.SILENT: $(DOC_DIR) memcheck

# Compile both executables.
default: $(EXEC_1) $(EXEC_2)

# Create the directory for binary files.
$(BIN_DIR):
	mkdir -p $@

# Compile the executable for cat exercice.
$(EXEC_1): $(BIN_DIR)
	$(CC) $(SRC_DIR)/$(EXEC_1).c -g $(CFLAGS) -o $(BIN_DIR)/$@

# Compile the executable for concat exercice.
$(EXEC_2): $(BIN_DIR)
	$(CC) $(SRC_DIR)/$(EXEC_2).c -g $(CFLAGS) -o $(BIN_DIR)/$@

# Generate the documentation.
$(DOC_DIR):
	mkdir -p $@
	(cat Doxyfile 2> $(DOXYGEN_LOG);\
	echo 'GENERATE_LATEX=NO';\
	echo 'HAVE_DOT=NO';\
	echo 'OPTIMIZE_OUTPUT_FOR_C=YES';\
	echo 'OUTPUT_DIRECTORY=$@';\
	echo 'PROJECT_NAME=$(PROJECT_NAME)';\
	echo 'RECURSIVE=YES') | doxygen - >> $(DOXYGEN_LOG)
	ln -rsf $@/html/$(DOC_INDEX) $@/$(DOC_INDEX)

# Check for memory leaks.
# Use the result of the second exercise as input for the first exercise.
memcheck: default
	# Concat exercice
	echo 'abc' > tmp1
	echo '123' > tmp2
	valgrind --leak-check=full \
	--show-leak-kinds=all \
	--track-origins=yes \
	--verbose \
	--log-fd=9 9>$(VALGRIND_LOG) \
	$(BIN_DIR)/$(EXEC_2) tmp1 tmp2 tmp > /dev/null
	# Cat exercise
	valgrind --leak-check=full \
	--show-leak-kinds=all \
	--track-origins=yes \
	--verbose \
	--log-fd=9 9>>$(VALGRIND_LOG) \
	$(BIN_DIR)/$(EXEC_1) tmp > /dev/null
	rm tmp*

# Clean the working directory.
clean:
	rm -rf $(BIN_DIR) $(DOC_DIR) *.log
