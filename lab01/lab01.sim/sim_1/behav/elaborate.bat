@echo off
set xv_path=D:\\vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 32458e09b42043c6abc193c10d878f54 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_behav xil_defaultlib.test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
