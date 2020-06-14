@echo off
set QAENV=1
set PATH=c:\TAMLOG\reg\;c:\TAMLOG\iomodules\bin;%PATH%
echo %date:/=-%
rem set currdate=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
set currdate=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
rem set putver=%DATE:~7,2%-%DATE:~4,2%-%DATE:~10,4%
set putver=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set DB=LG
set id=lg
cd c:\TAMLOG\DDC\LG\


echo Backup LG Dev on "d:\logfin\FTP\DDC\%putver%-%id%\"



set NEW_DIR=d:\logfin\FTP\DDC\%putver%-%id%\
echo NEW_DIR %NEW_DIR%
echo " "
 
IF EXIST "%NEW_DIR%" (
    ECHO %NEW_DIR% found
	GOTO mkdir1
) ELSE (
    ECHO %NEW_DIR% not found
	GOTO copybcp
)

:mkdir1

echo Create "d:\logfin\FTP\DDC\%putver%-%id%-1"
mkdir "d:\logfin\FTP\DDC\%putver%-%id%-1"
copy c:\TAMLOG\DDC\LG\*.bcp "d:\logfin\FTP\DDC\%putver%-%id%-1\" 


:copybcp
echo create "d:\logfin\FTP\DDC\%putver%-%id%"
mkdir "d:\logfin\FTP\DDC\%putver%-%id%"
copy c:\TAMLOG\DDC\LG\*.bcp "d:\logfin\FTP\DDC\%putver%-%id%\"
