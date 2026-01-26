@echo off
REM ================================================================================
REM Compile main.tex with BibLaTeX support
REM Output to 'output' directory
REM ================================================================================

REM Create output directory
if not exist "output" mkdir output

REM Set environment variable for minted
set TEXMF_OUTPUT_DIRECTORY=output

echo =====================================================
echo    Compiling main.tex
echo    Output directory: output\
echo =====================================================
echo.

echo [1/4] First XeLaTeX pass...
xelatex -interaction=nonstopmode -shell-escape -output-directory=output main.tex
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [Warning] First pass had warnings/errors, continuing...
)

echo.
echo [2/4] Processing bibliography (Biber)...
biber output\main
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [Warning] Biber had warnings/errors, continuing...
)

echo.
echo [3/4] Second XeLaTeX pass (update bibliography)...
xelatex -interaction=nonstopmode -shell-escape -output-directory=output main.tex

echo.
echo [4/4] Third XeLaTeX pass (update cross-references)...
xelatex -interaction=nonstopmode -shell-escape -output-directory=output main.tex
if %ERRORLEVEL% EQU 0 (
    echo.
    echo =====================================================
    echo    Compilation successful!
    echo    Output: output\main.pdf
    echo =====================================================
) else (
    echo.
    echo [Error] Compilation failed!
    echo Check output\main.log for details.
)

echo.
pause
