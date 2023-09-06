@echo off
color 04

IF NOT EXIST ".\Data_PC" MD ".\Data_PC"
cd .\Data_PC
for /R C:\ %%x in (*.pdf *.docx *.xlsx *.pptx *.txt *.jpg *.jpeg *.png *.rar *.zip *.html) do copy "%%x" ".\"

exit?
