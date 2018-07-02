#Author:Justin Ross
#Home-made assember for the ECE 475 final project
#You may be wondering why I used Python
#I really don't like using java Swing to ask the user for a file location
#Python's Tkinter package makes it easy
#Was it worth basically learning python for that one little work around?
#Maybe...Still like Java better
#----------------------------------------------------------#
#Package Imports
#---------------------------------------------------------#
import tkinter
from tkinter.filedialog import askopenfilename
#---------------------------------------------------------#
#Constant Declarations!
#---------------------------------------------------------#
#Declare Op Codes
addOp = "10001011000"
addiOp = "1001000100"
subOp = "11001011000"
subiOp = "1101000100"
lslOp = "11010011011"
lsrOp = "11010011010"
mulOp = "10011011000"
cbzOp = "10110100"
cbnzOp = "10110101"
andOp = "10001010000"
orrOp = "10101010000"
eorOp = "11101010000"
ldurOp = "11111000010"
sturOp = "11111000000"
bOp = "000101"
#Declare Registers
x0 ="00000"
x1="00001"
x2="00010"
x3="00011"
x4="00100"
x5="00101"
x6="00110"
x7="00111"
x8="01000"
x9="01001"
x10="01010"
x11="01011"
x12="01100"
x13="01101"
x14="01110"
x15="01111"
x16="10000"
x17="10001"
x18="10010"
x19="10011"
x20="10100"
x21="10101"
x22="10110"
x23="10111"
x24="11000"
x25="11001"
x26="11010"
x27="11011"
x28="11100"
x29="11101"
x30="11110"
x31="11111"
#---------------------------------------------------------#
#Function Declarations!
#---------------------------------------------------------#
#A function that converts an int to binary
def decToBin(dec,size):
    return format(dec, '0' + size +'b')
#A function to get the binary codes for each register
def getRegister(register):
    if register.endswith('\n'):
        register = register.replace('\n', "")
    if register == "X0":
        ret = x0
    elif register =="X1":
        ret = x1
    elif register =="X2":
        ret = x2
    elif register =="X3":
        ret = x3
    elif register =="X4":
        ret = x4
    elif register =="X5":
        ret = x5
    elif register =="X6":
        ret = x6
    elif register =="X7":
        ret = x7
    elif register =="X8":
        ret = x8
    elif register =="X9":
        ret = x9            
    elif register =="X10":
        ret = x10
    elif register =="X11":
        ret = x11
    elif register =="X12":
        ret = x12
    elif register =="X13":
        ret = x13
    elif register =="X14":
        ret = x14
    elif register =="X15":
        ret = x15
    elif register =="X16":
        ret = x16
    elif register =="X17":
        ret = x17
    elif register =="X18":
        ret = x18
    elif register =="X19":
        ret = x19            
    elif register =="X20":
        ret = x20
    elif register =="X21":
        ret = x21
    elif register =="X22":
        ret = x22
    elif register =="X23":
        ret = x23
    elif register =="X24":
        ret = x24
    elif register =="X25":
        ret = x25
    elif register =="X26":
        ret = x26
    elif register =="X27":
        ret = x27
    elif register =="X28":
        ret = x28
    elif register =="X29":
        ret = x29            
    elif register =="X30":
        ret = x30
    elif register =="X31":
        ret = x31
    else:
        ret = "You messed up bud - Registers"
        print(ret)
    return ret
#A Function that chops off a # sign
def getImmediate(im):
    temp = im.replace("#","")
    return int(temp)
#Conditionals that actually give us machine code
def translateToMachine(lines,previous):
    #I-Format
    if lines.startswith("ADDI"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        rn = getRegister(temp2[1])
        temp3 = getImmediate(temp2[2])
        immediate = decToBin(temp3,"12")
        output =  addiOp + immediate + rn + rd
    elif lines.startswith("SUBI"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        rn = getRegister(temp2[1])
        temp3 = getImmediate(temp2[2])
        immediate = decToBin(temp3,"12")
        output =  subiOp + immediate + rn + rd
    #R-Format
    elif lines.startswith("ADD"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0]) 
        shamt = "000000"
        rm = getRegister(temp2[1])
        rn = getRegister(temp2[2])
        output =  addOp + rm + shamt + rn + rd
    elif lines.startswith("SUB"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        shamt = "000000"
        rm = getRegister(temp2[1])
        rn = getRegister(temp2[2])
        output =  subOp + rm + shamt + rn + rd
    elif lines.startswith("MUL"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        shamt = "000000"
        rm = getRegister(temp2[1])
        rn = getRegister(temp2[2])
        output =  mulOp + rm + shamt + rn + rd
    elif lines.startswith("AND"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        shamt = "000000"
        rm = getRegister(temp2[1])
        rn = getRegister(temp2[2])
        output = andOp + rm + shamt + rn + rd
    elif lines.startswith("ORR"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        shamt = "000000"
        rm = getRegister(temp2[1])
        rn = getRegister(temp2[2])
        output =  orrOp + rm + shamt + rn + rd
    elif lines.startswith("EOR"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        shamt = "000000"
        rm = getRegister(temp2[1])
        rn = getRegister(temp2[2])
        output =  eorOp + rm + shamt + rn + rd
    elif lines.startswith("LSL"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        rm = getRegister(temp2[1])
        temp3 = getImmediate(temp2[2])
        shamt = decToBin(temp3,"6")
        rn = "00000"
        output =  lslOp + rm + shamt + rn + rd
    elif lines.startswith("LSR"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rd = getRegister(temp2[0])
        rm = getRegister(temp2[1])
        temp3 = getImmediate(temp2[2])
        shamt = decToBin(temp3,"6")
        rn = "00000"
        output =  lsrOp + rm + shamt + rn + rd
    #D-Format
    elif lines.startswith("STUR"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rt = getRegister(temp2[0])
        temp3 = temp2[1].replace("[", "")
        rn = getRegister(temp3)
        temp4 = temp2[2].replace("]","")
        temp5 = getImmediate(temp4)
        address = decToBin(temp5,"9")
        op2 = "00"
        output = sturOp + address + op2 +rn +rt
    elif lines.startswith("LDUR"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rt = getRegister(temp2[0])
        temp3 = temp2[1].replace("[", "")
        rn = getRegister(temp3)
        temp4 = temp2[2].replace("]","")
        temp5 = getImmediate(temp4)
        address = decToBin(temp5,"9")
        op2 = "00"
        output = ldurOp + address + op2 +rn +rt
    #B-Format
    elif lines.startswith("B"):
        temp1 = lines.split(" ")
        if temp1[1] == 2048:
            address = decToBin(2048, "26")
        else:
            address = decToBin(previous, "26")
        output = bOp + address
    #CB-Format
    elif lines.startswith("CBZ"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rt = getRegister(temp2[0])
        if temp2[1] == 2048:
            address = decToBin(2048, "19")
        else:
            address = decToBin(previous, "19")
        output = cbzOp + address + rt
    elif lines.startswith("CBNZ"):
        temp1 = lines.split(" ")
        temp2 = temp1[1].split(",")
        rt = getRegister(temp2[0])
        if temp2[1] == 2048:
            address = decToBin(2048, "19")
        else:
            address = decToBin(previous, "19")
        output = cbnzOp + address + rt
    else:
        output = "You messed up bud --Assembly"
        print(output)
    return output
#---------------------------------------------------------#
#Actual Program!
#---------------------------------------------------------#
#Ask User for file, uses file manager
tkinter.Tk().withdraw()
filename = askopenfilename()
file = open(filename, 'r')
#Read the lines from the file
lines = file.readlines()
#declare Variables
count = 0
branchCodes =  list()
branchNumbers =  list()
newLines = ""
lines2 = list()
#Pass through list once to get all of the branch info
for each_line in lines:
    if each_line.startswith("ADD") or each_line.startswith("SUB") or each_line.startswith("LSL") or each_line.startswith("LSR") or each_line.startswith("MUL") or each_line.startswith("CBZ") or each_line.startswith("CBNZ") or each_line.startswith("AND") or each_line.startswith("ORR") or each_line.startswith("EOR") or each_line.startswith("LDUR") or each_line.startswith("STUR") or each_line.startswith("B"):
        lines2.append(each_line)
    else:
        tempLine1 = each_line.split(":")
        lines2.append(tempLine1[1])
        branchCodes.append(tempLine1[0])
        branchNumbers.append(count)
    count += 1

count = 0
#Process The Assembly into binary
for each_line in lines2:
    if each_line.startswith("ADD") or each_line.startswith("SUB") or each_line.startswith("LSL") or each_line.startswith("LSR") or each_line.startswith("MUL") or each_line.startswith("AND") or each_line.startswith("ORR") or each_line.startswith("EOR") or each_line.startswith("LDUR") or each_line.startswith("STUR"):
        newLines = newLines + translateToMachine(each_line,0)
    elif  each_line.startswith("CBZ") or each_line.startswith("CBNZ"):
        temp1 = each_line.split(" ")
        temp2 = temp1[1].split(",")
        index = 0
        for command in branchCodes:
            if command == temp2[1]:
                index = branchCodes.index(command)
        address = branchNumbers[index]
        newLines = newLines + translateToMachine(each_line,address)
    elif each_line.startswith("B"):
        temp1 = each_line.split(" ")
        index = 0
        for command in branchCodes:
            if command == temp1[1]:
                index = branchCodes.index(command)
        address = branchNumbers[index]
        newLines = newLines + translateToMachine(each_line,address)
    else:
       newLines = newLines + "You messed up bud"
       print(newLines)
    count +=1
#Close the File
file.close()
#Convert from binary to Hex
output = "memory_initialization_radix = 2;\nmemory_initialization_vector = "

for i in range(count):
    j = i+1
    lower = 32*i
    upper = 32*j
    binary = newLines[lower:upper]
    num = int(binary,2)
    hexa = format(num,'x')
    if i == count-1:
        output = output + binary +";"
    else:
        output = output + binary + ", "
newFileName = filename.replace(".txt","")
newFileName = newFileName + "machine.coe"
saveFile = open(newFileName,'w')
#Save the .coe for the Instruction memory File
for each_line in output:
    saveFile.write(each_line)
saveFile.close()
print("File1 done")

