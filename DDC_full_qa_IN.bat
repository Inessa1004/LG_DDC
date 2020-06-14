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

mkdir "d:\logfin\FTP\DDC\%putver%-%id%"
echo Run bcp out QA TAMLFQA
echo c:\TAMLOG\DDC\LG\DDC_out_qa.bat

bcp eMergeBIS4530DB.SAPIENS.LG    out "C:\TAMLOG\DDC\LG\LG.bcp"     -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LG_qa_out.lst" 
bcp eMergeBIS4530DB.SAPIENS.LGCAT out "C:\TAMLOG\DDC\LG\LGCAT.bcp"  -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LGCAT_qa_out.lst" 
bcp eMergeBIS4530DB.SAPIENS.LGSEC out "C:\TAMLOG\DDC\LG\LGSEC.bcp"  -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LGSEC_qa_out.lst" 
bcp eMergeBIS4530DB.SAPIENS.LGLEX out "C:\TAMLOG\DDC\LG\LGLEX.bcp"  -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LGLEX_qa_out.lst" 
bcp eMergeBIS4530DB.SAPIENS.LGDLK out "C:\TAMLOG\DDC\LG\LGDLK.bcp"  -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LGDLK_qa_out.lst"

echo Check qa out Results
rem find /c "Failed" "failed"  c:\TAMLOG\DDC\LG\*qa_out.lst > c:\TAMLOG\DDC\LG\bcp_output_qa_failed.lst | notepad c:\TAMLOG\DDC\LG\bcp_output_qa_failed.lst
find /c "Failed" "NativeError"  c:\TAMLOG\DDC\LG\*qa_out.lst

copy c:\TAMLOG\DDC\LG\*.bcp "d:\logfin\FTP\DDC\%putver%-%id%\"
del /Q "d:\logfin\FTP\DDC\%putver%-%id%\LGSEC_DEV.bcp"
del /Q "d:\logfin\FTP\DDC\%putver%-%id%\LGSEC.bcp"

echo Put LG*.bcp to FTP Inbox

rem mkdir ddc-lg-02-05-2019
rem mkdir ddc-lg-curdatever
type C:\TAMLOG\commands\ftp_ddc.txt| C:\TAMLOG\commands\repl "currdate" "%currdate%" | C:\TAMLOG\commands\repl "id" "%id%" | C:\TAMLOG\commands\repl "DB" "%DB%" | C:\TAMLOG\commands\repl "putver" "%putver%"  > C:\TAMLOG\commands\ftp_ddc_lg.txt.new
ftp -i -s:C:\TAMLOG\commands\ftp_ddc_lg.txt.new

type c:\TAMLOG\commands\LG_mail.txt | C:\TAMLOG\commands\repl "id" "%id%" | C:\TAMLOG\commands\repl "DB" "%DB%" | C:\TAMLOG\commands\repl "putver" "%putver%"  > C:\TAMLOG\commands\LG_mail_new.txt

java -jar \\lpiway02\JavaDist\sendmail.jar inesa.l@sapiens.com  inesa.l@sapiens.com,yehuda.m@sapiens.com,Yaron.Muchnik@sapiens.com,Ofer.Shamir@sapiens.com,Ron.Koifman@sapiens.com,David.Dura@sapiens.com "tamlogver LG sent to FTP" "LG sent to ftp, mail text is attached" "c:\TAMLOG\commands\LG_mail_new.txt"

del C:\TAMLOG\commands\ftp_ddc_lg.txt.new
del C:\TAMLOG\commands\LG_mail_new.txt
del c:\TAMLOG\DDC\LG\shem_girsa.tran
del c:\TAMLOG\DDC\LG\shem_girsa.lst
