> 🇬🇷 Ελληνική έκδοση: [README_GR.md](./README_GR.md)

# VLSI Systems Design – Laboratory
### Course: VLSI Systems Design
### Academic Year: 2020–2021

This repository contains my laboratory work for the course
**VLSI Systems Design**, focusing on **digital hardware design using VHDL**
and **high-level synthesis (HLS)**.

The laboratory covers the complete flow from **combinational logic** and
**parametric components** to **memory blocks**, **system-level integration**
and **FPGA-oriented synthesis**, including a final HLS-based design.

---

## 🧠 Topics & Technologies

- Hardware description using **VHDL**
- Parametric and generic-based design
- Structural vs behavioral modeling
- Memory design and FPGA block RAM
- Testbenches and simulation
- Synthesis and resource analysis
- High-Level Synthesis (HLS) using C/C++
- FPGA-oriented digital system design

---

## 🧪 Laboratory Exercises

### 🔹 Exercise 1 – Parametric Logic & Datapath Blocks
- Bitwise **64-bit NAND** using generate statements
- **1-bit full adder**
- **8-bit logic unit** (AND / XOR)
- Logic unit with **registered outputs**

Focus: modular VHDL design, parametrization, and basic datapath construction.

---

### 🔹 Exercise 2 – Combinational Circuit Design
- Implementation of a Boolean function using:
  - basic logic gates (AND, OR, NOT)
  - multiplexers
- Two alternative VHDL architectures (structural and behavioral)

Focus: combinational logic synthesis and architectural comparison.

---

### 🔹 Exercise 3 – Memory Systems
- Custom **32×8 RAM** in VHDL
- FPGA **Block RAM** (RAMB18E1) implementation
- Testbenches and timing verification
- FPGA constraint file (XDC)

Focus: memory modeling, synthesis and verification.

---

### 🔹 Exercise 4 – Generic Components & System Integration
- Parametric logic blocks:
  - 8-bit XOR
  - 16-bit OR
  - 32-bit NAND
  - 64-bit NOR
- Multiplexer-based integration
- Large composite logic unit with testbenches

Focus: scalable design using **generics** and component-based system building.

---

### 🔹 Exercise 5 – High-Level Synthesis (HLS)
- **3×3 matrix multiplier (5-bit elements)**
- VHDL RTL implementation
- HLS C/C++ implementation:
  - without pragmas
  - with optimization pragmas
- Comparison of latency, resources, and performance

Focus: hardware design using both **RTL** and **HLS** methodologies.

---

## 📁 Repository Structure

The repository is organized by exercise, typically including:
- VHDL source files
- C/C++ HLS source files (where applicable)
- Testbenches
- FPGA constraint files
- Technical reports

---

## 🎯 Purpose of This Repository

This repository documents my experience in:

- digital hardware design with VHDL
- parametric and modular VLSI systems
- memory design and FPGA resources
- verification through simulation and testbenches
- high-level synthesis and design space exploration

---

## 🔐 License

This repository contains personal academic laboratory work.
It is shared for **educational and reference purposes only**.

Please do not submit this material as your own coursework.

**All Rights Reserved.**
