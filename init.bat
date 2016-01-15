@echo off

chcp 65001>nul

prompt [%USERNAME%@%COMPUTERNAME% $p]$_$$$s

rem Fake a UNIX environment

doskey clear=cls
doskey ls=dir /d $*
doskey cp=copy $*
doskey mv=move $*
doskey rm=del $*
doskey cat=type $*
doskey touch=type nul$G$G$*
doskey pwd=echo %CD%

rem Easier navigation

doskey cd=cd /D $*
doskey cd..=cd ..
doskey ..=cd ..
doskey ...=cd ../..
doskey ....=cd ../../..

rem List files properly

doskey l=dir /b $*
doskey ll=dir /b $*

rem Edit functionality

if exist ""%PROGRAMFILES%\Sublime Text 3"" (
    doskey edit="%PROGRAMFILES%\Sublime Text 3\sublime_text" $*
)
where atom >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    doskey edit=atom $*
)
where code >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    doskey edit=start /min code $*
)

rem Open functionality

doskey open=start $*

@echo on
