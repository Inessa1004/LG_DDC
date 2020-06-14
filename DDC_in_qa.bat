rem sqlcmd -S tamlfqa -d eMergeBIS4530DB  -U sapiens -P sapiens  -i  c:\TAMLOG\DDC\LG\DDC_del.sql -o c:\TAMLOG\DDC\LG\DDC_qa_trunc.lst
bcp eMergeBIS4530DB.SAPIENS.LG    in "C:\TAMLOG\DDC\LG\LG.bcp"     -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LG_qa_in.lst" 
bcp eMergeBIS4530DB.SAPIENS.LGCAT in "C:\TAMLOG\DDC\LG\LGCAT.bcp"  -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LGCAT_qa_in.lst" 
bcp eMergeBIS4530DB.SAPIENS.LGLEX in "C:\TAMLOG\DDC\LG\LGLEX.bcp"  -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LGLEX_qa_in.lst" 
bcp eMergeBIS4530DB.SAPIENS.LGDLK in "C:\TAMLOG\DDC\LG\LGDLK.bcp"  -c -S "tamlfqa" -U sapiens -P sapiens -o "C:\TAMLOG\DDC\LG\LGDLK_qa_in.lst" 