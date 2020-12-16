/**
 * @file concat.c
 * @brief Merge two files into another.
 * @author David Brousseau
 * @version 0.1
 * @date December 2020
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Get the file size.
 * @param file File to seek
 */
long getSize(FILE *file)
{
    fseek(file, 0L, SEEK_END);
    long int size = ftell(file) + 1;
    rewind(file);
    return size;
}

/**
 * Write the contents of a file to an output file.
 * @param inputFilename Input filename
 * @param outputFile Output file
 */
void writeFile(const char *inputFilename, FILE *outputFile)
{
    FILE *file = fopen(inputFilename, "r");
    if (file == NULL)
    {
        fprintf(stderr, "concat: %s: %s\n", inputFilename, strerror(errno));
        exit(EXIT_FAILURE);
    }
    long size = getSize(file);
    char buffer[size];
    while (fgets(buffer, size, (FILE *)file))
    {
        fputs(buffer, outputFile);
    }
    fclose(file);
}

/**
 * Launch the concat command.
 * @param argc Number of parameters
 * @param argv Files to merge
 * @return Exit status
 */
int main(int argc, const char *argv[])
{
    if (argc != 4)
    {
        fprintf(stderr, "Use: bin/concat <input-filename> <input-filename> <output-filename>\n");
        exit(EXIT_FAILURE);
    }
    FILE *file = fopen(argv[3], "w");
    if (file == NULL)
    {
        fprintf(stderr, "concat: %s: %s\n", argv[3], strerror(errno));
        exit(EXIT_FAILURE);
    }
    writeFile(argv[1], file);
    writeFile(argv[2], file);
    fclose(file);
    return EXIT_SUCCESS;
}
