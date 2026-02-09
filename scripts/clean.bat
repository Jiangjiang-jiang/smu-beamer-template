@echo off
cd /d "%~dp0.."

if exist "output" rd /S /Q output 2>nul
del /Q main.aux main.log main.out main.pdf main.vrb 2>nul
del /Q main.nav main.snm main.toc main.bbl main.bcf 2>nul
del /Q main.blg main.run.xml 2>nul
del /Q main_test.* 2>nul
del /Q _80D1384B945DB004EEEEC20E678A1F85* 2>nul
echo Cleanup complete!
pause
