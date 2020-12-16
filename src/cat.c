/**
 * @file cat.c
 * @brief Display the contents of a file in the terminal.
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
 * Print the file in the terminal.
 * @param file File to print
 */
void printFile(FILE *file)
{
    long size = getSize(file);
    char buffer[size];
    while (fgets(buffer, size, (FILE *)file))
    {
        fprintf(stdout, "%s", buffer);
    }
    printf("\n");
}

/**
 * Launch the cat command.
 * @param argc Number of parameters
 * @param argv File to display
 * @return Exit status
 */
int main(int argc, const char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "Use: bin/cat <filename>\n");
        exit(EXIT_FAILURE);
    }
    for (int i = 1; i < argc; i++)
    {
        FILE *file = fopen(argv[i], "r");
        if (file == NULL)
        {
            fprintf(stderr, "cat: %s: %s\n", argv[i], strerror(errno));
            exit(EXIT_FAILURE);
        }
        printFile(file);
        fclose(file);
    }
    return EXIT_SUCCESS;
}
