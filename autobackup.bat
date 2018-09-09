@echo off
title Autobackup
echo           =Auto Backup=
echo    =-= Made by Johnanater =-=
echo.

:: Variables
:: Be sure there's no trailing slash!

:: Where is the directory you want to backup?
SET Directory=C:\Unturned\Servers

:: Where should the backups be stored?
SET BackupDir=C:\UnturnedBackups

:: WinRAR or 7Zip?
SET CompressionProgram=WinRAR

:: Directory of the Program specified above
SET CompressionProgramDir=C:\Program Files\WinRAR

:: The name of the folder inside the zip
SET ZipFolderName=Servers


::=======================================================================================::
:: I wouldn't edit anything past here if I were you, but if you want to, go right ahead! ::
::=======================================================================================::


:: Timestamp for backups.
:: Credit: 7DaysToDie's server script
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
	IF "%%~L"=="" goto s_done
	SET _yyyy=%%L
	SET _mm=00%%J
	SET _dd=00%%G
	SET _hour=00%%H
	SET _minute=00%%I
	SET _second=00%%K
)
:s_done

SET _mm=%_mm:~-2%
SET _dd=%_dd:~-2%
SET _hour=%_hour:~-2%
SET _minute=%_minute:~-2%
SET _second=%_second:~-2%

SET LOGTIMESTAMP=__%_yyyy%-%_mm%-%_dd%__%_hour%-%_minute%-%_second%

:: The copy command has errors suppressed
:: This is so the copy command won't stop if you have a plugin 
:: such as PLSTimedSpy or a plugin that moves (Hopefully not too important) files

:: This is also a good place to run prebackup procedures (Such as BES)
echo.
echo Copying...
echo.
:: If you need to copy some other folders, just copy paste this line!
:: Make sure you include a trailing slash if it's a directory!
xcopy "%Directory%" "temp\%ZipFolderName%\" /e /v /c /q

echo Finished copying at %TIME% - %DATE%

echo.
echo Starting compresssion at %TIME% - %DATE%
if %CompressionProgram%==WinRAR ( goto StartWinRAR )
if %CompressionProgram%==7Zip ( goto Start7Zip ) else ( goto NoProgram )

:StartWinRAR
:: If you want to password protect your backups, just add this to the parameters:
:: -hp(YourPassword)
:: If you have spaces or any special characters, be sure to include quotes!
"%CompressionProgramDir%"\Rar.exe a -m5 -r -s -t -ep1 -inul "%BackupDir%\backup%LOGTIMESTAMP%.rar" "temp\%ZipFolderName%\"
goto end

:Start7Zip
:: If you want to password protect your backups, just add this to the parameters:
:: -p(YourPassword) -mhe
:: If you have spaces or any special characters, be sure to include quotes!
"%CompressionProgramDir%"\7z.exe a -m0=lzma2 -mx -r -bb0 "%BackupDir%\backup%LOGTIMESTAMP%.7z" ".\temp\%ZipFolderName%\"
goto end

:NoProgram
cls
echo.
echo You did not specify a correct compression program
echo.
pause >nul
goto end

:: Delete the temp directory
:: This is also a good place to run any postbackup procedures (Such as BES)
:end
if exist temp\%ZipFolderName%\ (
	rmdir /s /q temp\%ZipFolderName%\
)
echo.
echo Finished at %TIME% - %DATE%
echo.
pause >nul
exit