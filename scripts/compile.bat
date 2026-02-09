@echo off
cd /d "%~dp0.."
if not exist "output" mkdir output
set TEXMF_OUTPUT_DIRECTORY=output

echo [1/4] XeLaTeX pass...
xelatex -interaction=nonstopmode -shell-escape -output-directory=output main.tex

echo [2/4] Biber...
biber output\main

echo [3/4] XeLaTeX pass...
xelatex -interaction=nonstopmode -shell-escape -output-directory=output main.tex

echo [4/4] XeLaTeX pass...
xelatex -interaction=nonstopmode -shell-escape -output-directory=output main.tex
if %ERRORLEVEL% EQU 0 (
    echo Compilation successful! Output: output\main.pdf
) else (
    echo Compilation failed! Check output\main.log
)
pause
