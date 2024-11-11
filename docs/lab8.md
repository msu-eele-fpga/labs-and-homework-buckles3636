# Lab 8: Creating LED Patterns With a C Program

## Overview
In this lab, we developed a program that writes LED patterns to `/dev/mem` based on terminal commands or input from a file. The program accepts the following arguments:

```
Usage: ./led-patterns [-h] [-v] [-p <pattern1> <time1> ...] [-f <filename>]
```

- **`-h`**: Show help.
- **`-v`**: Enable verbose mode.
- **`-p`**: Display patterns with specified times (variable arguments).
- **`-f`**: Read patterns and times from a file.

When the program finishes or is terminated with `Ctrl+C`, the FPGA is reset to hardware control mode.

## Calculating Component Addresses
To calculate the component addresses used by the program:
1. Start with the **base address**, which in this case is `0xFF200000`.
2. Add the **component offset** from Platform Designer. My component offset is `0x00000000`, so no addition is required.
3. Add the **register index**. Each register is spaced 4 bytes apart.

Thus:
- **Software control register**: `0xFF200000` (base address + index 0).
- **LED register (register 2)**: `0xFF200008` (base address + 8 bytes).

## LED Patterns Code
You can find the complete implementation here:  
[led-patterns.c](../sw/led-patterns.c)
