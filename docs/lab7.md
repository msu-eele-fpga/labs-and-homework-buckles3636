# Lab 7: Accessing Registers via /dev/mem

## Overview
In this lab, we accessed and controlled the LED patterns registers from the quartus system console and via Linux on the HPS using memory-mapped I/O via `/dev/mem`. We tested reading and writing to the HPS-to-FPGA Lightweight bridge and verified the correct functionality of the hardware and software.

## Steps
1. **Use System Console to Verify Lab 6 Functionality:** Read and write from HPS registers and insure it affects the LED patterns component as expected.
2. **Convert `.sof` to `.rbf`:** Program the FPGA by placing the `soc_system.rbf` file on the SD card.
3. **Test Registers with `busybox devmem`:** Verified that we could read and write to the FPGA registers using `busybox devmem`.
4. **Create and Cross-compile C Program:** Wrote a C program to easily read and write from registers via `/dev/mem`, cross-compiled it for ARM, and placed it on the SD card.
5. **Test Program on DE10 Nano:** Verified functionality by testing the devmem command in a putty serial terminal.

## Base Periods
1. **0.125-second base period:** Hex value = `0x9`.
2. **0.5625-second base period:** Hex value = `0x2`.
