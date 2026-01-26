@echo off
REM ================================================================================
REM Clean LaTeX auxiliary files
REM ================================================================================

echo Cleaning build files...

REM Remove output directory
if exist "output" (
    echo Removing output directory...
    rd /S /Q output 2>nul
    echo Output directory removed
)

REM Clean root directory leftover files
del /Q main.aux 2>nul
del /Q main.log 2>nul
del /Q main.out 2>nul
del /Q main.pdf 2>nul
del /Q main.vrb 2>nul
del /Q main.nav 2>nul
del /Q main.snm 2>nul
del /Q main.toc 2>nul
del /Q main.bbl 2>nul
del /Q main.bcf 2>nul
del /Q main.blg 2>nul
del /Q main.run.xml 2>nul

REM Clean old test files
del /Q main_test.* 2>nul

REM Clean minted cache
del /Q _80D1384B945DB004EEEEC20E678A1F85* 2>nul
rd /S /Q _minted 2>nul

echo.
echo Cleanup complete!
pause
