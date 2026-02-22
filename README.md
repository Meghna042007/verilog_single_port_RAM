## Parameterized Synchronous Single-Port RAM (Verilog)
## Overview
This project implements a parameterized synchronous single-port RAM using Verilog HDL.
The design supports controlled read and write operations through enable signals and provides a registered output, ensuring stable and predictable data retrieval.
The RAM is fully configurable in terms of memory depth, address width, and data width, making it suitable for simulation experiments, FPGA learning, and basic RTL memory modeling.
This implementation demonstrates how memory is modeled in hardware using register arrays and synchronous control logic.
## Features
Synchronous operation (clock-driven read and write)

Parameterized memory depth and data width

Automatically computed address width using $clog2

Registered output for stable read behavior

Write-priority design (write overrides read if both enabled)

Idle state holds previous output value

Simulation testbench for functional verification

## Module Interface
## Inputs

clk – System clock

wr_en – Write enable

rd_en – Read enable

data_in – Data to be written into memory

address – Memory location for read/write

## Output

data_out – Registered output data from memory

## Internal Design
The RAM is modeled using a register array:

mem[ ] stores data values

data_reg holds the output value (registered read)

Behavior on each clock edge:


Condition         Operation

wr_en = 1      Write data_in to memory at address

rd_en = 1      Read memory at address into output register

otherwise      Hold previous output value

This ensuresdeterministic synchronous behavior.

## Parameterization
Parameter  Description

depth = Number of memory locations

a_width = Address width (auto = log2(depth))

d_width = Data width per memory word

## Testbench Functionality

The testbench verifies:

Writing to multiple memory addresses

Reading stored values

Overwriting existing memory locations

Reading uninitialized memory

Output stability during idle state

Clock is generated using a periodic toggle, and operations are applied sequentially to observe correct synchronous behavior.

## Expected Simulation Behavior

Data is written only when wr_en = 1

Data is read only when rd_en = 1

Writes take priority over reads

Output updates one clock after read request

Output remains unchanged when both enables are low

Reading an unwritten address may produce unknown (X) in simulation


## Concepts Demonstrated

RTL memory modeling using register arrays

Synchronous read and write control

Parameterized hardware design

Registered outputs

Address-based memory access

Simulation-driven verification

## Notes

This is a single-port RAM, meaning read and write share the same address port.

Read and write cannot occur simultaneously on different addresses.

Output is registered for synchronous timing behavior.

## Author

Developed as part of hands-on learning in RTL design, digital memory systems, and Verilog HDL simulation.
