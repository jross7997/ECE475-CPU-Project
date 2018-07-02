**ECE 475 Project**
-CPU Design
The Assembler takes in basic ARM Assembly code and is capable of interpreting
•	ADD
•	ADDI
•	SUB
•	SUBI
•	LSL 
•	LSR
•	MUL
•	CBZ
•	CBNZ
•	AND
•	ORR
•	EOR
•	LDUR
•	STUR
•	B
The code must be properly formatted in a .txt file. There can only be one space between
the instruction name and the following registers. Branching is supported, but there must
be a colon with no spaces between the branch name and the instruction
An example would be
ADDI X19,X31,#10
ADDI X20,X31,#6
MUL X21,X19,X20
ADD X10,X19,X20
ADDI X11,X31,#40
ADDI X9,X31,#0
loop:ADD X12,X21,X9
ADD X13,X22,X9
STUR X12,[X13,#0]
ADDI X9,X9,#1
SUB X14,X11,X9
CBNZ X14,loop
ADD X13,X22,X10
LSL X12,X10,#2
LDUR X14,[X13,#0]
SUB X15,X14,X13
CBNZ X15,check
less:ADD X21,X19,X20
ADDI X11,X31,#2047
STUR X21,[X11,#1]
B return
check:LSR X15,X15,#64
CBNZ X15,less
SUB X21,X19,X20
ADDI X11,X31,#2047
STUR X21,[X11,#1]
return:LDUR X23,[X31,#0]

The CPU takes in the .coe file that the assembler generates and is stored in instruction memory
The Main.xpr has everything that is needed to run this on a Nexsys 4 FPGA.
Fair warning, the CPU does not work properly. There seems to be a mistake in how everything is
connected. 