# SMU Beamer Theme

This is an unofficial Beamer presentation template for Singapore Management University (SMU).
It is designed for postgraduate academic presentations, including seminars, defenses, and talks.

- **Author:** qsang 

- **Contact:** qsangxin@gmail.com

Screenshots are follows and here is a full [demo](./main.pdf).

|           Title Page            |           Key Features           |
| :-----------------------------: | :------------------------------: |
| ![Title Page](images/title.png) | ![Features](images/features.png) |
|     **Blocks & Components**     |     **Syntax Highlighting**      |
|  ![Blocks](images/blocks.png)   |     ![Code](images/code.png)     |

## Compilation & Installation

Besides the LaTeX environment (MiKTeX or TeX Live), the project requires Python 3.x and Pygments for the `minted` package:

```bash
git clone https://github.com/Jiangjiang-jiang/smu-beamer-template.git
cd smu-beamer-template
pip install Pygments
```

### Using Scripts

The project includes build scripts under the `scripts/` directory:

```bash
# Windows
.\scripts\compile.bat
.\scripts\clean.bat

# Linux / macOS
./scripts/compile.sh
./scripts/clean.sh
```

`main.pdf` is under the dictionary `output/`.

### Manual Compilation

```bash
xelatex -shell-escape -output-directory=output main.tex
biber output/main
xelatex -shell-escape -output-directory=output main.tex
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

\maketitle

\begin{frame}{Introduction}
    Your content goes here.
\end{frame}

\backmatter

\end{document}
```

## Project Structure

This theme is designed to be highly customizable. You can modify components, code rendering styles, and font settings. The tree of files is:

```text
smu-beamer-template/
├── main.tex
├── ref.bib
├── .gitignore
│
├── scripts/             # Build scripts
│   ├── compile.bat      
│   ├── compile.sh       
│   ├── clean.bat        
│   └── clean.sh         
│
├── smu.sty              # Theme package file
│
├── smucore/             # Theme modules
│   ├── smucolors.def    # Color setting
│   ├── smufonts.def     # Font setting
│   ├── smucode.def      # Code highlighting
│   ├── smucommands.def  # Custom commands
│   ├── smublocks.def    # Blocks
│   └── smutemplates.def # Page templates
│
├── fonts/               # Custom fonts (Calibri, Consolas)
│
├── source/              # Theme assets
│   ├── smu_header_large_left.png
│   └── smu_header_small_left.png
│
└── output/              # Build output (auto-generated)
    ├── main.pdf         # Final PDF
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

Section pages are automatically generated. To disable section pages, do not use `\section{}` command in your slides or comment out the following line in `smucore/smutemplates.def`:

```latex
\AtBeginSection[]{\smusectionpage}
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
Use `\smucode{value}` for general inline code.
```

### Block Environments

```latex
% Standard Block
\begin{block}{Title}
    Content
\end{block}

% Light Box
\begin{lightbox}
    Highlighted information
\end{lightbox}

% Alert Block
\begin{alertblock}{Warning}
    Important notice
\end{alertblock}

% Theorem Box
\begin{theorem}[Optional Name]
    Theorem statement
\end{theorem}

% Tag Block
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

```latex
% Colored Bold Text
\textbf{text}      % Blue bold (SMU blue)
\redbf{text}       % Red bold
\bluebf{text}      % Muted blue bold

% Highlighted Text
\shadedtext{text}                    % Blue background
\shadedtext[red]{text}               % Custom color background
\shadedmathbox{x^2 + y^2}            % Math with background
```

### Code Style

Edit `smucore/smucode.def` to change highlighting style:

```latex
\usemintedstyle{solarized-light}
```

`solarized-light` is set as the default code rendering theme. See the full list of available options: https://pygments.org/styles/

## Disclaimer

This is an unofficial theme and is not affiliated with or endorsed by Singapore Management University (SMU). The project is provided "as is," and users are responsible for ensuring compliance with SMU’s official brand guidelines and academic integrity policies.