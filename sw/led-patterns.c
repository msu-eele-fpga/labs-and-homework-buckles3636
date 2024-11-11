#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <string.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <getopt.h>
#include <signal.h>

// Address 
const uint32_t baseaddress = 0xFF200000;
const uint32_t ledaddress = 0xFF200008;

void Usage() {
    printf("Usage: ./led-patterns [-h] [-v] [-p <pattern1> <time1> ...] [-f <filename>]\n");
    printf("-h : Show help\n");
    printf("-v : Verbose mode\n");
    printf("-p : Display patterns with times (variable arguments)\n");
    printf("-f : Read patterns and times from a file\n");
}

void WriteRegDevmem(uint32_t ADDRESS, uint32_t VALUE) {

    // Define Page Size
    const size_t PAGE_SIZE = sysconf(_SC_PAGE_SIZE);

    // Open DevMem
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd == -1)
    {
        fprintf(stderr, "failed to open /dev/mem.\n");
        return;
    }

    // Align Page 
    uint32_t page_aligned_addr = ADDRESS & ~(PAGE_SIZE - 1);

    // Map a page of physical memory into virtual memory
    uint32_t *page_virtual_addr = (uint32_t *)mmap(NULL, PAGE_SIZE,
        PROT_READ | PROT_WRITE, MAP_SHARED, fd, page_aligned_addr);
    if (page_virtual_addr == MAP_FAILED)
    {
        fprintf(stderr, "failed to map memory.\n");

        return;
    }

    // Offset Page
    uint32_t offset_in_page = ADDRESS & (PAGE_SIZE - 1);

    // Compute Virtual Address
    volatile uint32_t *target_virtual_addr = page_virtual_addr + offset_in_page/sizeof(uint32_t*);

    // Write Devmem
    *target_virtual_addr = VALUE;

    return;
}

void WriteFileDevMem(char *filename, int verbose) {

    // Varibles
    uint32_t pattern = 0x00000000;
    int waittime = 0;
    
    // Open Command File 
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Failed to open file");
        return;
    }

    // Buffer for reading file
    char line[256];

    // Write Devmem Based on File
    while (fgets(line, sizeof(line), file)) {

        // Read and write the value
        pattern = strtoul(line, NULL, 0);
        WriteRegDevmem(ledaddress, pattern);

        // Read the wait time
        if (fgets(line, sizeof(line), file)) {
            waittime = strtoul(line, NULL, 0);
            usleep(waittime * 1000);  // Wait for specified milliseconds
        } else {
            printf("No more wait times; exiting.\n");
            break;
        }

        // Print to terminal if verbose
        if (verbose) {
        printf("Pattern: %u Time: %u\n", pattern, waittime);
        }
    }

    // Close file when done
    fclose(file);
}

void handle_sigint(int sig) {
    // Return to hardware mode
    printf("Canceled returning to hardware mode...");
    WriteRegDevmem(baseaddress, 0x0);  // Return to hardware mode

    // Exit the program
    exit(0);
}
int main(int argc, char **argv) {
    // Steup exit and cleanup
    signal(SIGINT, handle_sigint);

    // Define variables
    int hflag = 0;
    int vflag = 0;
    int pflag = 0;
    int fflag = 0;

    char *pfilename = "pvalues.txt";
    char *ffilename = NULL;

    int command;
    opterr = 0;

    // Open Pfile 
    FILE *pfile = fopen(pfilename, "w");
    if (pfile == NULL) {
        perror("Failed to open file");
        return 1;
    }

    // Get Opt Loop
    while ((command = getopt(argc, argv, "hvp:f:")) != -1) {
        switch (command) {
            case 'h':
                hflag = 1;
                break;

            case 'v':
                vflag = 1;
                break;

            case 'p':
                pflag = 1;
                optind--;
                for (; optind < argc && *argv[optind] != '-'; optind++) {
                    fprintf(pfile, "%s\n", argv[optind]);
                }
                break;

            case 'f':
                fflag = 1;
                ffilename = optarg;
                break;

            case '?':
                fprintf(stderr, "Unknown option `-%c`. Use -h for help.\n", optopt);
                fclose(pfile);
                return 1;

            default:
                abort();
        }
    }

    // Close pfile (so it can be opened in read mode)
    fclose(pfile);

    // Logic to call DevMem writer with different files and parameters
    if (hflag) {
        // Print help
        Usage();
    } else if (pflag && !fflag) {
        // Turn on soc led control 
        WriteRegDevmem(baseaddress, 0x1);
        // Write pfile
        WriteFileDevMem(pfilename, vflag);
    } else if (!pflag && fflag) {
        // Turn on soc led control
        WriteRegDevmem(baseaddress, 0x1);
        // Write ffile
        WriteFileDevMem(ffilename, vflag);
    } else {
        fprintf(stderr, "Incompatible operators. Use -h for help.\n");
    }

    return 0;
}
