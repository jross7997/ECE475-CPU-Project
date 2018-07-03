@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 068a9941147a44c39ebe45e1c151cb55 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot register_file_tb_behav xil_defaultlib.register_file_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
