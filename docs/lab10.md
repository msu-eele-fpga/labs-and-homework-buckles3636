# Lab 10: Using Device Trees to Control LEDs

## Overview
In this lab, we explored the use of **device trees** to describe and configure hardware for embedded Linux systems. Specifically, we set up and modified device tree files to enable kernel-level control of an LED on the DE10-Nano board.

## Objectives
1. Understand the role of device trees in embedded Linux.
2. Configure a device tree to describe an LED connected to the HPS GPIO.
3. Use the `gpio-leds` driver to control the LED via the `sysfs` interface.

## Summary 
- **Device Tree Setup**: Created and modified hierarchical device tree files to describe the DE10-Nano hardware, including LEDs.
- **Kernel Integration**: Compiled the custom device tree into a binary blob and integrated it into the Linux boot process.
- **LED Control via Sysfs**: Verified the configuration by controlling the LED through the `sysfs` interface. Tested various triggers, including a heartbeat trigger, and recompiled the kernel to enable missing functionality.

## Questions
N/A
