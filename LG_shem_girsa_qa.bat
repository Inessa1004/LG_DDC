@echo off
set QAENV=1
set PATH=c:\TAMLOG\regqa\;c:\TAMLOG\iomodules\bin;%PATH%
echo %date:/=-%
rem set currdate=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
set currdate=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
rem set putver=%DATE:~7,2%-%DATE:~4,2%-%DATE:~10,4%
set putver=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set DB=LG
set id=lg
cd c:\TAMLOG\DDC\LG\

type c:\TAMLOG\commands\shem_girsa_temp.txt| c:\TAMLOG\commands\repl "DATE" "%currdate%" > c:\TAMLOG\DDC\LG\shem_girsa_qa.tran 
rem notepad c:\TAMLOG\DDC\LG\shem_girsa.tran

echo Run dbblp update on LG
echo "dbblp -u f -d lg -i c:\TAMLOG\DDC\LG\shem_girsa_qa.tran -o c:\TAMLOG\DDC\LG\shem_girsa_qa.lst"

dbblp -u f -d lg -i c:\TAMLOG\DDC\LG\shem_girsa_qa.tran -o c:\TAMLOG\DDC\LG\shem_girsa_qa.lst