#  SPI Design Projects

### RTL Design | Serial Communication | FPGA Synthesis

A collection of SPI-based RTL projects developed using **Verilog/SystemVerilog**, with simulation and synthesis analysis using ModelSim and Intel Quartus Prime Lite.

The portfolio covers SPI master–slave communication, a PMOD DA4 DAC controller, and SPI daisy-chain concepts, with source code, testbenches, and design evidence organized by project.

<p align="center">
  <img src="https://img.shields.io/badge/HDL-Verilog%20%7C%20SystemVerilog-blue?style=flat-square" alt="HDL: Verilog and SystemVerilog" />
  <img src="https://img.shields.io/badge/Simulation-ModelSim-green?style=flat-square" alt="Simulation: ModelSim" />
  <img src="https://img.shields.io/badge/Synthesis-Quartus%20Prime-orange?style=flat-square" alt="Synthesis: Quartus Prime" />
  <img src="https://img.shields.io/badge/Target-Cyclone%20V-purple?style=flat-square" alt="Target device family: Cyclone V" />
</p>

---

##  Project Portfolio

### 01 · SPI Master–Slave Communication

**Folder:** [`01_SPI_Master_Slave/`](./01_SPI_Master_Slave/)

An RTL implementation of SPI master–slave communication, covering serial transmission and reception, clock generation, and chip-select control.

**Highlights**
- 8-bit serial data handling
- FSM-based transmit and receive logic
- SPI clock generation using a divider
- ModelSim waveform inspection
- Quartus Prime synthesis analysis

Open the [`01_SPI_Master_Slave/`](./01_SPI_Master_Slave/) for its RTL, testbench, waveform, and synthesis documentation.

### 02 · PMOD DA4 SPI Controller

**Folder:** [`02_PMOD_DA4_SPI_Controller/`](./02_PMOD_DA4_SPI_Controller/)

An SPI controller for interfacing with the Digilent Pmod DA4 digital-to-analog converter (DAC), using initialization and data-transmission frames.

**Highlights**
- 32-bit command-frame handling
- DAC initialization sequence
- Clock division for SPI timing
- FSM-based transmission control
- Simulation and synthesis analysis

Open the [`PMOD DA4 project folder`](./02_PMOD_DA4_SPI_Controller/) for its RTL, testbench, waveform, and synthesis documentation.

### 03 · SPI Daisy-Chain Design

**Folder:** [`03_SPI_Daisy_Chain/`](./03_SPI_Daisy_Chain/)

An RTL project exploring serial data transfer and shift-register-based communication in an SPI daisy-chain configuration.

**Highlights**
- Serial data shifting
- Master–slave signal integration
- Transaction sequencing
- ModelSim simulation
- Quartus Prime synthesis analysis

Open the [`SPI Daisy-Chain project folder`](./03_SPI_Daisy_Chain/) for its implementation and supporting evidence.

---

##  Tools & Technologies

| Category | Technology |
|---|---|
| Hardware description | Verilog / SystemVerilog |
| RTL simulation | ModelSim Intel FPGA Edition |
| Synthesis and design analysis | Intel Quartus Prime Lite |
| FPGA device family | Intel Cyclone V |
| Version control | Git / GitHub |

##  RTL Design Workflow

```text
RTL Development
      ↓
Testbench Development
      ↓
Functional Simulation
      ↓
Waveform Inspection
      ↓
Synthesis & Design Analysis
      ↓
Documentation and GitHub
```

Each project is documented separately to keep the RTL source, testbench, simulation evidence, and synthesis report easy to find.


##  Repository Structure

```text
SPI-Design-Projects/
├── 01_SPI_Master_Slave/
├── 02_PMOD_DA4_SPI_Controller/
├── 03_SPI_Daisy_Chain/
├── LICENSE
└── README.md
```


*The tree shows the main organization; consult each folder for its complete file list.*

##  Learning Objectives

- Understand SPI communication and serial data transfer.
- Design FSM-based RTL modules.
- Develop and run HDL testbenches.
- Inspect timing and data signals using simulation waveforms.
- Analyze synthesized RTL using FPGA design tools.
- Maintain structured, documented hardware-design projects.


##  Author

**Rushikesh Dandgawhal**

[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github)](https://github.com/Rushikesh-Dandgawhal)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/rushikesh-dandgawhal-793246353/)

---

*RTL design, simulation, and synthesis projects focused on digital design and VLSI engineering.*


