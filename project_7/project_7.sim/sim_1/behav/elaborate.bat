@echo off
set xv_path=D:\\vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 7458441a51a047fc9a50a6fe6b076b77 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tset_behav xil_defaultlib.tset xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
