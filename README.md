# SPI Design Projects | Verilog & SystemVerilog

A collection of RTL design projects exploring Serial Peripheral Interface (SPI) communication, master–slave data transfer, SPI operating modes, DAC interfacing, and daisy-chain concepts.

The projects are developed and evaluated through RTL simulation and FPGA synthesis using ModelSim and Intel Quartus Prime Lite.

## Projects

### 1. SPI Master–Slave Communication

**Folder:** [`01_SPI_Master_Slave/`](./01_SPI_Master_Slave/)

An RTL implementation of SPI master–slave communication with serial data transmission and reception.

**Key concepts**
- SPI master and slave architecture
- Serial data transmission and reception
- Serial clock generation
- Chip-select control
- FSM-based control logic
- Simulation waveform analysis

**Evidence:** ModelSim simulation waveform and Quartus synthesis report are included in the project folder.

### 2. PMOD DA4 SPI Controller

**Folder:** [`02_PMOD_DA4_SPI_Controller/`](./02_PMOD_DA4_SPI_Controller/)

An SPI controller designed to communicate with the Digilent Pmod DA4 digital-to-analog converter (DAC), using a 32-bit command frame.

**Key concepts**
- SPI-based peripheral interfacing
- DAC initialization and data transmission
- Clock division for SPI communication
- FSM-based command sequencing
- Serial frame verification

**Evidence:** Simulation waveform and synthesis report are included in the project folder.

### 3. SPI Daisy-Chain Design

**Folder:** [`03_SPI_Daisy_Chain/`](./03_SPI_Daisy_Chain/)

An exploration of serial peripheral communication and daisy-chain data transfer using RTL modules.

**Key concepts**
- Serial communication between SPI modules
- Shift-register-based data handling
- Master–slave signal connections
- Transaction sequencing
- ModelSim waveform inspection

See the project folder for its RTL source, testbench, simulation evidence, and synthesis report.

> Refer to the individual RTL files to confirm the exact number of connected slaves and the implemented chain configuration.

## Tools & Technologies

| Category | Tools |
|---|---|
| Hardware description language | Verilog / SystemVerilog |
| RTL simulation | ModelSim Intel FPGA Edition |
| Synthesis and design analysis | Intel Quartus Prime Lite |
| Target device family | Intel Cyclone V |
| Version control | Git and GitHub |

## Design and Verification Workflow

1. Develop the RTL modules.
2. Create testbenches to exercise the intended functionality.
3. Run simulations and inspect relevant waveforms in ModelSim.
4. Analyze and synthesize the RTL in Quartus Prime Lite.
5. Review synthesis reports and document the results.
6. Organize source code, testbenches, and evidence in GitHub.

## Repository Structure

```text
SPI-Design-Projects/
├── 01_SPI_Master_Slave/
├── 02_PMOD_DA4_SPI_Controller/
├── 03_SPI_Daisy_Chain/
├── LICENSE
└── README.md
```

Each project folder contains its own implementation files and supporting documentation.

## Project Status

These projects focus on RTL development, simulation-based evaluation, and synthesis analysis. Results and limitations are documented at the individual project level. Physical FPGA hardware validation is not claimed.

## Author

**Rushikesh Dandgawhal**

- [GitHub Profile](https://github.com/Rushikesh-Dandgawhal)
- [SPI Design Projects Repository](https://github.com/Rushikesh-Dandgawhal/SPI-Design-Projects)

