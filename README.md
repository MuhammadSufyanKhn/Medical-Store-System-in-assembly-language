# SSUET Medical Store - 8086 Assembly Program

A simple, console-based medical store billing system written in 8086 Assembly Language. This program allows users to view a menu of available medicines, select an item, input the desired quantity, and instantly view the total calculated price in PKR.

## 🚀 Features

* **Interactive Menu:** Displays a clear list of medicines with their respective prices.
* **Dynamic Calculation:** Automatically calculates the total cost based on the selected medicine and user-defined quantity.
* **Input Validation:** Handles invalid menu choices and prompts the user to try again.
* **Continuous Loop:** Offers a post-purchase menu allowing users to return to the main menu for another transaction or exit the program gracefully.

## 📋 Medicine Catalog

| ID | Medicine Name | Price (PKR) |
| :--- | :--- | :--- |
| 1 | Panadol | 10/- |
| 2 | Naproxen | 20/- |
| 3 | T-Day | 30/- |
| 4 | Dispirin | 40/- |
| 5 | Folic Acid | 50/- |
| 6 | Flagyl | 90/- |

## 🛠️ Prerequisites

To run or modify this code, you will need an 8086 Assembly emulator or assembler. Popular options include:
* [EMU8086](https://emu8086-microprocessor-emulator.en.softonic.com/) (Easiest for testing and debugging)
* **DOSBox** combined with **TASM** (Turbo Assembler) or **MASM** (Macro Assembler)

## 💻 How to Run

**Using EMU8086:**
1. Clone this repository or download the `.asm` file.
2. Open EMU8086.
3. Open the `.asm` file in the emulator.
4. Click the **Emulate** button at the top.
5. In the emulator window, click **Run** to start the application.

**Using DOSBox & TASM:**
1. Mount your local directory in DOSBox.
2. Assemble the code: `tasm filename.asm`
3. Link the object file: `tlink filename.obj`
4. Run the executable: `filename.exe`

## 📖 Usage Instructions

1. Upon starting, the program will display the "SSUET Medical Store" welcome banner and the medicine list.
2. Enter the **Number** (1-6) corresponding to the medicine you wish to buy.
3. When prompted, enter the **Quantity** (use single-digit integers for accurate 8086 AAM arithmetic).
4. The system will output the `Total Price` in PKR.
5. Press `1` to return to the Main Menu or `2` to Exit the program.

