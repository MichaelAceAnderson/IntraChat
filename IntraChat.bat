rem     ___   ____________
rem    /   | / ____/ ____/
rem   / /| |/ /   / __/   
rem  / ___ / /___/ /___   
rem /_/  |_\____/_____/   
rem
color 0a
title IntraChat
set chat=T:\Echanges\chat.txt
set timestamp=[%date% - %TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%]
set hidden=
echo %timestamp% %computername% s'est connect‚ au tchat ! >> %chat%
:Chat
cls
set msg=
echo Bienvenue dans IntraChat !
echo Commandes:
echo - exit (Quitter)
rem echo - H (cacher le fichier log du tchat)
rem echo - S (r‚tablir le fichier log du tchat)
echo - (laisser vide pour mettre le tchat … jour)
if exist %chat% (
    type %chat%
) else (
    echo Le fichier de tchat n'existe pas !
)
if "%hidden%"=="true" goto :Hidden
if "%hidden%"=="false" goto :Shown
goto :Input
:Hidden
set hidden=
echo Si le fichier existe, il est d‚sormais invisible !
goto :Input
:Shown
set hidden=
echo Si le fichier existe, il est d‚sormais visible !
goto :Input
:Input
set timestamp=[%date% - %TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%]
set /p msg=%timestamp% %computername%: 
if "%msg%"=="H" goto :Hide
if "%msg%"=="S" goto :Show
if "%msg%"=="exit" goto :End
if "%msg%"=="" goto :Chat
echo %timestamp% %computername%: %msg%>>"%chat%"
goto :Chat
:Hide
attrib +s +h %chat%
cls
set hidden=true
goto :Chat
:Show
attrib -s -h %chat%
cls
set hidden=false
goto :Chat
:End
echo %timestamp% %computername% a quitt‚ le tchat ! >> %chat%
echo Merci d'avoir utilis‚ IntraChat !
pause
exit