# Digital Clock using Verilog

## 📌 Project Description

This project implements a simple digital clock using Verilog HDL.

The clock displays:

- Hours: 00 to 23
- Minutes: 00 to 59
- Seconds: 00 to 59

The clock automatically increments the seconds, minutes, and hours.

## 🛠️ Tools Used

- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave (optional)

## 📂 Project Files

| File | Description |
|------|-------------|
| digital_clock.v | Main digital clock design |
| digital_clock_tb.v | Testbench |
| output.txt | Simulation output |
| README.md | Project documentation |

## ⚙️ Working

1. The clock receives a clock signal.
2. Every positive edge increases the seconds.
3. After 59 seconds, seconds become 00 and minutes increase.
4. After 59 minutes, minutes become 00 and hours increase.
5. After 23:59:59, the clock returns to 00:00:00.
6. Reset sets the clock to 00:00:00.

## ▶️ How to Run in VS Code

Install Icarus Verilog.

Open the project folder in VS Code.

Run:

```bash
iverilog -o digital_clock_sim digital_clock.v digital_clock_tb.v
