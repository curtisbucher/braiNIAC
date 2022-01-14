*Recent Changes may have broken the project temporarily*


![Creepy Programmer](https://cortexitrecruitment.com/wp-content/uploads/commodore-1200x565.jpg)

# The braiNIAC brainfuck computer. 
The braNIAC is a homebrew computer designed to natively run the [brainfuck](https://en.wikipedia.org/wiki/Brainfuck) esoteric programming language.

## But first, a little background... 

The brainfuck programming language was created by Urban Müller in 1993, designed to challenge and amuse programmers. Although the language is Turing complete, it is incredibly minimal, consisting of only eight commands. 

The brainfuck language uses a simple machine model consisting of the program and instruction pointer, as well as a one-dimensional array of at least 30,000 [byte](https://en.wikipedia.org/wiki/Byte) cells initialized to zero; a movable [data pointer](https://en.wikipedia.org/wiki/Pointer_(computer_programming))  and two streams of bytes for input and output (most often connected to a keyboard and a monitor respectively, and using the [ASCII](https://en.wikipedia.org/wiki/ASCII) character encoding).

#### Commands

| Character |                           Meaning                            |
| :-------: | :----------------------------------------------------------: |
|    `>`    | Increment the [data pointer](https://en.wikipedia.org/wiki/Pointer_(computer_programming)) (to point to the next cell to the right). |
|    `<`    | Decrement the data pointer (to point to the next cell to the left). |
|    `+`    |  Increment (increase by one) the byte at the data pointer.   |
|    `-`    |  Decrement (decrease by one) the byte at the data pointer.   |
|    `.`    |             Output the byte at the data pointer.             |
|    `,`    | Accept one byte of input, storing its value in the byte at the data pointer. |
|    `[`    | If the byte at the data pointer is zero, then instead of moving the [instruction pointer](https://en.wikipedia.org/wiki/Program_Counter) forward to the next command, [jump](https://en.wikipedia.org/wiki/Branch_(computer_science)) it *forward* to the command after the *matching* `]` command. |
|    `]`    | If the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward to the next command, jump it *back* to the command after the *matching* `[` command. |

## The Brainiac

The braiNIAC is my imlementation of a computer processor designed to natively run brainfuck machine code. The first version was finished in 2017, while I was a sophmore in high school. The first design consisted of 7400 series chips, but was never fully constructed due to implementation issues.

After putting off the project for 3 years in 2019, my interest was piqued again after taking a digital design class in college. Thus, the second generation of braiNIAC was written in Vivado, and implemented on Diligent's Basis 3 FPGA.

### Useage

If you want to try out the current braiNIAC implementation, simply download the project files, and open */hdl/braiNIAC.xpr* with Xilinx Vivado (tested on version 2021.2). Then just compile the binaries and load onto your FPGA as you normally would. If you have any FPGA other than a Basys 3 board, you will need to modify the constraints file to match your board. 

To load a program into the braiNIAC, load a *.coe* file from the */bf-scripts* directory into the "PM" ROM IP using Vivado's wizard. Odds are, if you are the kind of person who has Vivado installed, none of this should be too difficult for you.

To create your own *.coe* program files from a bf source, navigate to the */bf-scripts* directory and create a new *.bf* source file with your code. Then, compile the code with `python3 bf_conv.py yourcode.bf` and the script will create a new *.coe* for you to load into the hardware.

Input and output are handled by a serial monitor, run on a host computer. Code was tested with teraterm, running at 9600 baud with no parity bits and 1 stop bit.

![](https://content.instructables.com/ORIG/FPJ/F60I/IXGFN0KB/FPJF60IIXGFN0KB.png?auto=webp&frame=1&width=357&fit=bounds&md=40faf14a2f2ea584fd0f75fdfed250a7)

### Progress

**December 2021**: As of now, the braiNIAC is unable to properly accept serial input. Everything else works perfectly.



![](https://raw.githubusercontent.com/paraseba/hbf/e86d1ffebcb0795a7c2c6081e2dd27c4154db066/mandelbrot.png)

*Mandelbrot in brainfuck*
