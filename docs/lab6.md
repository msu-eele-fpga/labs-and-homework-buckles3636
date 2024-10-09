# Lab 6: Creating Component in Platform Designer

## Project Overview
In this lab, we are building on the existing LED patterns hardware by adding software control capabilities. Specifically, we are creating registers that can be accessed from the HPS (Hard Processor System) through memory-mapped operations. To achieve this, we will:
- Create a new VHDL component called `led_patterns_avalon` that interfaces with the Avalon memory-mapped bus.
- Use Quartus' Platform Designer to integrate this component into the HPS-to-FPGA Lightweight bus.
- Verify that the LED patterns hardware continues to function correctly after integrating the memory-mapped registers.

By the end of this lab, we will have created a functional system where the LED pattern component can be controlled via software through memory-mapped registers connected to the HPS.

## System Architecture
The system architecture involves an HPS interfacing with the FPGA's Avalon memory-mapped bus through the HPS-to-FPGA Lightweight bridge. The `led_patterns_avalon` component is responsible for interfacing with this bus and controlling the LED patterns through software. The component includes:
- **Three registers**: `hps_led_control`, `base_period`, and `led_reg` for controlling the LED patterns.
- **Memory-mapped operations**: The software running on the HPS accesses these registers through read and write operations.
- **I/O interfaces**: External inputs from the push buttons and switches, as well as outputs to control the LEDs.

### Block Diagram
![Block/State Diagram](/assets/Lab6BlockDiagram.png)

## Register Map
The following registers are defined within the `led_patterns_avalon` component:

| Register Name        | Address | Bitfield Description                                      |
|----------------------|---------|----------------------------------------------------------|
| `hps_led_control`    | 0x00    | 32-bit control register for LED patterns.                |
| `base_period`        | 0x01    | 32-bit register for configuring the base period of the LED patterns. |
| `led_reg`            | 0x02    | 32-bit register for controlling the state of the LEDs.    |

## Bitfield Diagrams

# hps_led_control
| 31  | 30  | 29  | 28  | 27  | 26  | 25  | 24  | 23  | 22  | 21  | 20  | 19  | 18  | 17  | 16  |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |

| 15  | 14  | 13  | 12  | 11  | 10  | 9   | 8   | 7   | 6   | 5   | 4   | 3   | 2   | 1   | 0   |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |        8 bits to set the led output           |-|-|-|-|-|-|-|


# base_period
| 31  | 30  | 29  | 28  | 27  | 26  | 25  | 24  | 23  | 22  | 21  | 20  | 19  | 18  | 17  | 16  |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |

| 15  | 14  | 13  | 12  | 11  | 10  | 9   | 8   | 7   | 6   | 5   | 4   | 3   | 2   | 1   | 0   |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |0000.0000 floating point number for base period|-|-|-|-|-|-|-|

# led_reg
| 31  | 30  | 29  | 28  | 27  | 26  | 25  | 24  | 23  | 22  | 21  | 20  | 19  | 18  | 17  | 16  |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |

| 15  | 14  | 13  | 12  | 11  | 10  | 9   | 8   | 7   | 6   | 5   | 4   | 3   | 2   | 1   | 0   |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  |  x  | One bit boolean to set led register Boolean    |

## Platform Designer
In Quartus Platform Designer, we added the `led_patterns_avalon` component to the HPS-to-FPGA Lightweight bus to make the registers accessible from the HPS The registers were connected to the ARM CPUs via the HPS-to-FPGA Lightweight bridge using memory-mapped operations. The Avalon bus signals `avs_read`, `avs_write`, `avs_address`, `avs_readdata`, and `avs_writedata` were used for bus transactions.

## Conclusion
In this lab, we successfully integrated the LED patterns hardware with the HPS through the creation of memory-mapped registers. These registers were mapped to the HPS-to-FPGA Lightweight bus, allowing the software running on the HPS to control the LED patterns. After verifying the system's functionality, we confirmed that the LED patterns operate correctly as they did in Lab 4, now with added software control.

### Questions
N/A
