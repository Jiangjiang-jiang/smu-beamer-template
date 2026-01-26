# SMU Beamer Theme

This is an unofficial Beamer presentation template for Singapore Management University (SMU).
It is designed for postgraduate academic presentations, including seminars, defenses, and talks.

**Version:** 2.0.0 

**Author:** qsang 

**Contact:** qsangxin@gmail.com

|           Title Page            |           Key Features           |
| :-----------------------------: | :------------------------------: |
| ![Title Page](images/title.png) | ![Features](images/features.png) |
|     **Blocks & Components**     |     **Syntax Highlighting**      |
|  ![Blocks](images/blocks.png)   |     ![Code](images/code.png)     |

## Core Features

- **Official Design**: Built with SMU's official colors and logo assets for a professional look.
- **Modular Structure**: Organized into separate files (colors, fonts, code, etc.) for easy customization.
- **Professional Fonts**: Uses Calibri for text and Consolas for code to ensure readability.
- **Code Highlighting**: Powered by `minted` for professional syntax highlighting in over 100 languages.
- **Flexible Layouts**: Includes easy-to-use multi-column layouts, progress bars, and automatic section pages.
- **Pre-styled Blocks**: Custom environments for mathematical blocks, examples, and alerts that match the overall theme.

## Build & Installation

Besides the LaTeX environment (MiKTeX or TeX Live), the project requires Python 3.x and Pygments for the `minted` package:

```bash
git clone https://github.com/Jiangjiang-jiang/smu-beamer-template.git
cd smu-beamer-template
pip install Pygments
```

### Using Scripts for Compilation (Windows)

The project includes build scripts for Windows:

- `compile.bat`: Executes the full compilation pipeline (XeLaTeX → Biber → XeLaTeX).

- `clean.bat`: Removes auxiliary build files.

```bash
# Compile presentation (outputs to output/ directory)
.\compile.bat

# Clean build files
.\clean.bat
```

### Manual Compilation

```bash
# Step 1: First LaTeX pass
xelatex -shell-escape -output-directory=output main.tex

# Step 2: Process bibliography
biber output/main

# Step 3: Second LaTeX pass (update references)
xelatex -shell-escape -output-directory=output main.tex

# Step 4: Final LaTeX pass (resolve cross-references)
xelatex -shell-escape -output-directory=output main.tex
```

**Note:** The `-shell-escape` flag is required for minted code highlighting.

### Overleaf

To use this template on Overleaf:
1. Upload the project as a `.zip` file.
2. Set the Compiler to `XeLaTeX` in the project settings.

### Quick Start

Include the theme in your LaTeX preamble:

```latex
\documentclass[10pt,aspectratio=1610]{beamer}

\usepackage{smu}

\title{Presentation Title}
\author{Your Name}
\institute[SMU]{School of Computing and Information Systems}
\date{\today}

\begin{document}

\maketitle % Generates the SMU-styled title page

\begin{frame}{Introduction}
    Your content goes here.
\end{frame}

\backmatter % Generates the thank you page

\end{document}
```

## Project Structure

This theme is designed to be highly customizable. You can modify components, code rendering styles, and font settings in the following files:

```text
smu-beamer-template/
├── main.tex             # Main presentation file
├── ref.bib              # Bibliography
├── compile.bat          # Windows compilation script
├── clean.bat            # Windows cleanup script
├── .gitignore           # Git ignore rules
│
├── smu.sty              # Main theme package file
│
├── smucore/             # Theme component modules
│   ├── smucolors.def    # Color definitions
│   ├── smufonts.def     # Font configurations
│   ├── smucode.def      # Code highlighting setup
│   ├── smucommands.def  # Custom commands
│   ├── smublocks.def    # Block environments
│   └── smutemplates.def # Page templates
│
├── fonts/               # Custom fonts (Calibri, Consolas)
│
├── source/              # Theme assets
│   ├── smu_header_large_left.png  # Large SMU logo
│   └── smu_header_small_left.png  # Small SMU logo
│
└── output/              # Build output (auto-generated)
    ├── main.pdf         # Final PDF output
    └── ...
```

## Usage Guide

### Sections and Frames

```latex
\section{Section Title}

\begin{frame}{Frame Title}
    Frame content
\end{frame}
```

Section pages are automatically generated. To disable this feature, comment out the following line in your preamble or modify `smutemplates.def`:

```latex
% \AtBeginSection[]{\smusectionpage}
```

### Code Highlighting

Frames containing code must use the `[fragile]` option:

```latex
\begin{frame}[fragile]{Code Example}
\begin{minted}{python}
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
\end{minted}
\end{frame}
```

**Convenience Environments:**

```latex
\begin{pycode}
    Python code here
\end{pycode}

\begin{cppcode}
    C++ code here
\end{cppcode}
```

Available: `ccode`, `cppcode`, `pycode`, `javacode`, `jscode`, `tscode`, `gocode`, `rustcode`, `shellcode`, `sqlcode`

**Inline Code:**

```latex
Use `\pyinline{print("hello")}` for inline Python code.
Use `\cinline{int x = 0;}` for inline C code.
Use `\code[python]{value}` for general inline code.
```

### Block Environments

**Standard Block:**

```latex
\begin{block}{Title}
    Content
\end{block}
```

**Light Box:**

```latex
\begin{lightbox}
    Highlighted information
\end{lightbox}
```

**Alert Block:**

```latex
\begin{alertblock}{Warning}
    Important notice
\end{alertblock}
```

**Theorem Box:**

```latex
\begin{theorem}[Optional Name]
    Theorem statement
\end{theorem}
```

**Tag Block:**

```latex
\begin{tagblock}{Tag Label}
    Content with labeled tag
\end{tagblock}
```

### Multi-Column Layouts

**Two Columns:**

```latex
\begin{twocolumns}
    \leftcol{
        Left column content
    }
    \rightcol{
        Right column content
    }
\end{twocolumns}
```

**Three Columns:**

```latex
\begin{threecolumns}
    \leftcol[0.3]{
        Left column
    }
    \midcol[0.3]{
        Middle column
    }
    \rightcol[0.3]{
        Right column
    }
\end{threecolumns}
```

Column widths are customizable using optional parameters (default: 0.48 for two columns, 0.31 for three).

### Text Formatting

**Colored Bold Text:**

```latex
\textbf{text}      % Blue bold (SMU blue)
\redbf{text}       % Red bold
\bluebf{text}      % Muted blue bold
```

**Highlighted Text:**

```latex
\shadedtext{text}                    % Blue background
\shadedtext[red]{text}               % Custom color background
\shadedmathbox{x^2 + y^2}            % Math with background
```

### Lists

**Itemize:**

```latex
\begin{itemize}
    \item First item
    \item Second item
        \begin{itemize}
            \item Nested item
        \end{itemize}
\end{itemize}
```

**Enumerate:**

```latex
\begin{enumerate}
    \item First
    \item Second
\end{enumerate}
```

**Description:**

```latex
\begin{description}
    \item[API] Application Programming Interface
    \item[SDK] Software Development Kit
\end{description}
```

### Thank You Page

```latex
\backmatter  % Automatically creates thank you page
```

## Customization

### Colors

Edit `smucore/smucolors.def`:

```latex
% Change primary color
\definecolor{smublue}{HTML}{151C55}

% Add new color
\definecolor{mycolor}{HTML}{ABCDEF}

% Update beamer color
\setbeamercolor{title}{fg=mycolor}
```

### Fonts

Edit `smucore/smufonts.def`:

```latex
% Change font sizes
\setbeamerfont{title}{size=\fontsize{24}{26}\selectfont}

% Change font family
\setmainfont{Arial}  % Requires Arial installed
```

### Code Style

Edit `smucore/smucode.def`:

```latex
% Change highlighting style
\usemintedstyle{monokai}  % Dark theme
\usemintedstyle{xcode}    % Light theme

% Modify code box appearance
\setminted{
    bgcolor=white,
    fontsize=\small,
    linenos=false
}
```

Available styles: `default`, `solarized-light`, `monokai`, `dracula`, `nord`, `xcode`, `vs`, `friendly`, `one-dark`

Full list: https://pygments.org/styles/

### Layout

Edit `smucore/smutemplates.def`:

**Disable Section Pages:**

```latex
% Comment out:
% \AtBeginSection[]{\smusectionpage}
```

**Modify Progress Bar:**

```latex
% In footline template, adjust colors or height
\fill[mycolor] (current page.south west) rectangle ([yshift=5pt]...
```

**Change Margins:**
Edit `smu.sty`:

```latex
\setbeamersize{
  text margin left=10mm,  % Adjust as needed
  text margin right=10mm
}
```

## Disclaimer

This is an unofficial theme and is not affiliated with or endorsed by Singapore Management University (SMU). The project is provided "as-is" without any warranty. Users are responsible for ensuring their presentations comply with SMU's official brand guidelines and academic integrity policies.