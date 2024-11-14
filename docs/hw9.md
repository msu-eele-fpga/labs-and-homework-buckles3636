
# Lab 9: PWM Controller in VHDL

## Overview

In this lab, we developed a Pulse Width Modulation (PWM) controller in VHDL to generate a configurable PWM signal. This controller will be integrated into our final project to control an RGB LED.

## Assigned Data Types

My assigned data types are as follows:

- **Period:** 31.25 (W = 31, F = 25)
- **Duty Cycle:** 12.11 (W = 12, F = 11)

These fixed-point formats were used in the PWM controller implementation.

## Implementation

### PWM Controller Design

The PWM controller was implemented in `hdl/pwm/pwm_controller.vhd`. It accepts period and duty cycle inputs, with the duty cycle clamped between 0 and 1.

### Testbench

A testbench was created to simulate the controller:
- **Test Cases:** Used various `period` and `duty_cycle` values.
- **Clock Period:** Increased to 100 ns for faster simulation.
![Simulation Screenshot](/assets/hw-9/pwm-controller-wav.png)
Simulation results confirmed the correct generation of PWM signals.

## Physical Testing

### Quartus Project Setup

A new Quartus project was created:
1. The PWM controller was instantiated in the top-level module.
2. The output was mapped to a GPIO pin on the DE10 Nano.

### Oscilloscope Testing

The PWM output was verified using an oscilloscope in Cobleigh 601 with hardcoded test values:
- **Period:** 250 ms
- **Duty Cycle:** 25%
![Oscilloscope Screenshot 1](/assets/hw-9/scope1.png)
- **Period:** 125 ms
- **Duty Cycle:** 50%
![Oscilloscope Screenshot 2](/assets/hw-9/scope2.png)
The oscilloscope confirmed the correct period and duty cycle fro the given inputs
![Console Screenshot](/assets/hw-9/sys-console.png)

## Conclusion

This lab demonstrated the design and verification of a PWM controller in VHDL. It will be a key component in our final project for RGB LED control.

## Questions
N/A