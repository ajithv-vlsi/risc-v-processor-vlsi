\# RISC-V Single Cycle Processor

\## RTL to GDS Physical Design Flow



!\[Status](https://img.shields.io/badge/Status-Complete-green)

!\[PDK](https://img.shields.io/badge/PDK-Sky130-blue)

!\[Tool](https://img.shields.io/badge/Tool-OpenLane-orange)



\## Overview

32-bit RISC-V RV32I Single Cycle Processor designed in Verilog HDL.

Complete RTL-to-GDS flow implemented using OpenLane \& Sky130 130nm PDK.



\## Results

| Check | Result |

|-------|--------|

| DRC Violations | 0 |

| Setup Violations | 0 |

| Hold Violations | 0 |

| Flow Status | SUCCESS |



\## Modules

| Module | Description |

|--------|-------------|

| and\_gate.v | Basic AND gate |

| half\_adder.v | 2-bit adder |

| full\_adder.v | 3-bit adder with carry |

| alu\_4bit.v | 4-bit ALU (ADD/SUB/AND/OR) |

| register\_file.v | 32x32 register file |

| riscv\_core.v | Complete RISC-V processor |



\## Tools Used

\- \*\*HDL\*\*: Verilog

\- \*\*Simulation\*\*: EDA Playground (Icarus Verilog)

\- \*\*Synthesis\*\*: Yosys (via OpenLane)

\- \*\*PD Flow\*\*: OpenLane v1.1.1

\- \*\*PDK\*\*: SkyWater Sky130A 130nm

\- \*\*Layout Viewer\*\*: KLayout



\## chip Layout

!\[Chip Layout](docs/chip\_layout.png)



\## Target Role

Physical Design / PnR Engineer

NVIDIA | Qualcomm | Intel

