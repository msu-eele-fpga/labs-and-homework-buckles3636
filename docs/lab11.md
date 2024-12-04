
# Lab 11: Creating a Platform Device Driver

## Overview
This lab focuses on developing a **platform device driver** for the LED patterns component.

## Summary
- **Platform Driver Basics**: We defined a `platform_driver` structure, including probe and remove functions, to manage hardware devices.
- **Device Binding**: Configured a device tree entry with a compatible string to bind the device to our driver.
- **Probing and Removing**: Verified the driver’s ability to detect (`probe`) and remove (`remove`) the device dynamically through kernel messages.

## Questions and Answers

1. **What is the purpose of the platform bus?**  
   The platform bus manages devices that are not discoverable by the operating system. It allows the OS to interact with hardware devices defined statically, typically through the device tree or platform data.

2. **Why is the device driver’s compatible property important?**  
   The compatible property is used by the kernel to match the device with the appropriate driver. If the string in the device tree matches the driver’s `of_match_table`, the kernel binds the driver to the device.

3. **What is the probe function’s purpose?**  
   The probe function is called when the kernel binds the driver to a compatible device. It initializes the hardware, allocates resources, and sets up the driver to interact with the device.

4. **How does your driver know what memory addresses are associated with your device?**  
   The memory addresses are specified in the device tree under the `reg` property. The driver retrieves these addresses during the probe function using the `platform_get_resource()` function.

5. **What are the two ways we can write to our device’s registers? In other words, what subsystems do we use to write to our registers?**  
   - **DevMem**: Uses commands in a c program to accsess registers
   - **DeviceAttributes**: Accsessed as files in the nfs file system

6. **What is the purpose of our `struct led_patterns_dev` state container?**  
   This structure holds the state and resources of the device driver, including the memory-mapped I/O regions.

## Questions
N/A
