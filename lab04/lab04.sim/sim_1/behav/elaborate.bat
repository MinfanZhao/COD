@echo off
set xv_path=D:\\vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto c5f74f4264074084ad6cfa11b6dc8b60 -m64 --debug typical --relax --mt 2 -L blk_mem_gen_v8_3_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot test_behav xil_defaultlib.test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
