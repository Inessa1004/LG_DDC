@echo off
set QAENV=1
set PATH=c:\TAMLOG\reg\;c:\TAMLOG\iomodules\bin;%PATH%
echo %date:/=-%
rem set currdate=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
set currdate=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
cd c:\TAMLOG\DDC\LG\
echo Run update version tran

type c:\TAMLOG\commands\shem_girsa_temp.txt| c:\TAMLOG\commands\repl "DATE" "%currdate%" > c:\TAMLOG\DDC\LG\shem_girsa.tran 
notepad c:\TAMLOG\DDC\LG\shem_girsa.tran

echo Run dbblp update on LG

dbblp -u f -d lg -i c:\TAMLOG\DDC\LG\shem_girsa.tran -o c:\TAMLOG\DDC\LG\shem_girsa.lst

echo "dbblp -u f -d lg -i c:\TAMLOG\DDC\LG\shem_girsa.tran -o c:\TAMLOG\DDC\LG\shem_girsa.lst"

echo Run run_bcp_LG by LG_full.bat