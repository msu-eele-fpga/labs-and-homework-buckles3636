# Lab 4: LED Patterns 

## Project Overview
For Lab 4, we will be implementing a state machine to cycle between different LED pattern outputs. Each state corresponds to a unique pattern that will be displayed on a set of LEDs, using VHDL to design the control logic. A push button will trigger state transitions, and switches will determine the next state.

## Functional Requirements
1. Implement a state machine with at least five states (S0-S4) that each display a unique LED pattern.
2. The state machine will transition between states based on user input via a push button and switches.
3. When transitioning the new state will be shown as binary on the leds for 1 second.
3. LED patterns include:
   - S0: Single LED shift right.
   - S1: Two LEDs shift left.
   - S2: LED binary up counter.
   - S3: LED binary down counter.
   - S4: User defined "Pong" pattern with LEDs moving inward.
4. The base_period signal will set the time between led transitions
5. The push button must be used with the async conditioner 

## System Architecture
The system is designed around a state machine that controls the LED outputs. The architecture includes the following components:
- **State Machine**: Manages the transitions between different LED patterns.
- **Clock Divider**: Generates a slower clock signal for pattern timing.
- **Timed Counter**: Adds delay between state transitions.
- **Async Conditioner**: Debounces the push button input to prevent erratic state changes.
- **LED Pattern Processes**: Implements various patterns for each state (e.g., shift right, counter).

## Implementation Details
The implementation of the state machine is divided into several processes, including:
- **State Memory Process**: Holds the current state and updates it based on push button input.
- **Next State Logic**: Determines the next state based on switch inputs.
- **Output Logic**: Assigns the correct LED pattern to the `led` output signal based on the current state.
- **LED Pattern Processes**: Defines the individual patterns for each state, such as shifting LEDs or counting.

The clock is divided using the `clock_divider` component to ensure that the LED transitions occur at a human-perceivable rate. The state transitions are timed using the `timed_counter` component to give the user time to see the current state before the pattern starts.

## Deliverables
- **Block/State Diagram**  
  ![Block/State Diagram](/assets/Lab4BlockStateDiagram.png)
  
- **Simulation Waveform**  
  ![Waveform](/assets/led_patterns_wav.png)

### Questions 
N/A
