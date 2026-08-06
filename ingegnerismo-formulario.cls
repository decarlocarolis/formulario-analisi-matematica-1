\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ingegnerismo-formulario}[2026/08/06 v1.0 Ingegnerismo formula handbook]

\LoadClass[11pt,a4paper,oneside,open=any,headings=normal,parskip=half]{scrbook}

\RequirePackage[italian]{babel}
\RequirePackage{amsmath,mathtools}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\setmainfont{LibertinusSerif-Regular.otf}[
  BoldFont=LibertinusSerif-Bold.otf,
  ItalicFont=LibertinusSerif-Italic.otf,
  BoldItalicFont=LibertinusSerif-BoldItalic.otf
]
\setsansfont{LibertinusSans-Regular.otf}[
  BoldFont=LibertinusSans-Bold.otf,
  ItalicFont=LibertinusSans-Italic.otf,
  Scale=0.94
]
\setmonofont{LibertinusMono-Regular.otf}[Scale=0.92]
\setmathfont{LibertinusMath-Regular.otf}
\RequirePackage{microtype}
\RequirePackage{geometry}
\geometry{top=20mm,bottom=22mm,inner=20mm,outer=20mm,headsep=7mm,footskip=11mm}

\RequirePackage{array,booktabs,longtable,tabularx,multirow,calc}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage[most]{tcolorbox}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{hyperref}
\RequirePackage{bookmark}
\RequirePackage{xurl}
\RequirePackage{etoolbox}

\definecolor{IngBlue}{HTML}{183A5A}
\definecolor{IngTeal}{HTML}{1F6D78}
\definecolor{IngGold}{HTML}{A66B12}
\definecolor{IngRed}{HTML}{8A2F36}
\definecolor{IngGreen}{HTML}{2F6B4F}
\definecolor{IngInk}{HTML}{20252B}
\definecolor{IngPaleBlue}{HTML}{EEF4F8}
\definecolor{IngPaleTeal}{HTML}{EDF7F7}
\definecolor{IngPaleGold}{HTML}{FFF7E8}
\definecolor{IngPaleRed}{HTML}{FCEFF0}
\definecolor{IngPaleGreen}{HTML}{EEF7F1}
\definecolor{IngGray}{HTML}{5B6570}
\definecolor{IngLightGray}{HTML}{F3F5F6}

\color{IngInk}
\setkomafont{chapter}{\normalfont\sffamily\bfseries\color{IngBlue}}
\setkomafont{section}{\normalfont\sffamily\bfseries\color{IngBlue}}
\setkomafont{subsection}{\normalfont\sffamily\bfseries\color{IngTeal}}
\setkomafont{subsubsection}{\normalfont\sffamily\bfseries\color{IngGray}}
\setkomafont{part}{\normalfont\sffamily\bfseries\color{IngBlue}}
\setkomafont{caption}{\small\sffamily}
\setkomafont{pageheadfoot}{\small\sffamily\color{IngGray}}

\RedeclareSectionCommand[beforeskip=0pt,afterskip=1.2\baselineskip]{chapter}
\RedeclareSectionCommand[beforeskip=1.4\baselineskip,afterskip=.55\baselineskip]{section}
\RedeclareSectionCommand[beforeskip=1.1\baselineskip,afterskip=.4\baselineskip]{subsection}

\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}
\setlength{\parindent}{0pt}
\setlength{\parskip}{.45em plus .15em minus .1em}
\setlength{\LTpre}{.6em}
\setlength{\LTpost}{.8em}
\setlength{\tabcolsep}{5pt}
\renewcommand{\arraystretch}{1.18}
\setlist{nosep,leftmargin=*}
\setlist[enumerate,1]{label=\textbf{\arabic*.},itemsep=.28em,topsep=.3em}
\setlist[itemize,1]{label=\textcolor{IngTeal}{\textbullet},itemsep=.2em,topsep=.3em}
\AtBeginEnvironment{longtable}{\small}
\AtBeginEnvironment{tabularx}{\small}

\allowdisplaybreaks[2]
\raggedbottom
\emergencystretch=3em

\hypersetup{
  colorlinks=true,
  linkcolor=IngBlue,
  urlcolor=IngTeal,
  citecolor=IngGreen,
  pdfborder={0 0 0},
  bookmarksnumbered=true,
  bookmarksopen=true,
  hypertexnames=false
}

\newcommand{\tightlist}{}
\newcommand{\real}[1]{#1}
\newcommand{\passthrough}[1]{#1}
\providecommand{\pandocbounded}[1]{#1}
\providecommand{\pandocspan}[2]{#2}

\newtcolorbox{obiettivocapitolo}[1]{
  enhanced,breakable,colback=IngPaleBlue,colframe=IngBlue,
  boxrule=.7pt,arc=1.5mm,left=2.5mm,right=2.5mm,top=1.6mm,bottom=1.6mm,
  title={\sffamily\bfseries Obiettivo operativo: #1},fonttitle=\sffamily\bfseries
}
\newtcolorbox{sceltametodo}[1]{
  enhanced,breakable,colback=IngPaleTeal,colframe=IngTeal,
  boxrule=.7pt,arc=1.5mm,left=2.5mm,right=2.5mm,top=1.6mm,bottom=1.6mm,
  title={\sffamily\bfseries Scelta del metodo: #1},fonttitle=\sffamily\bfseries
}
\newtcolorbox{proceduraesame}[1]{
  enhanced,breakable,colback=white,colframe=IngBlue,
  borderline west={2.4pt}{0pt}{IngBlue},boxrule=.45pt,arc=1.2mm,
  left=3mm,right=2.5mm,top=1.6mm,bottom=1.6mm,
  title={\sffamily\bfseries Procedura d'esame: #1},fonttitle=\sffamily\bfseries
}
\newtcolorbox{errorefrequente}[1]{
  enhanced,breakable,colback=IngPaleRed,colframe=IngRed,
  boxrule=.65pt,arc=1.5mm,left=2.5mm,right=2.5mm,top=1.5mm,bottom=1.5mm,
  title={\sffamily\bfseries Errore frequente: #1},fonttitle=\sffamily\bfseries
}
\newtcolorbox{controllofinale}[1]{
  enhanced,breakable,colback=IngPaleGreen,colframe=IngGreen,
  boxrule=.65pt,arc=1.5mm,left=2.5mm,right=2.5mm,top=1.5mm,bottom=1.5mm,
  title={\sffamily\bfseries Controllo finale: #1},fonttitle=\sffamily\bfseries
}
\newtcolorbox{teoriaessenziale}[1]{
  enhanced,breakable,colback=IngLightGray,colframe=IngGray,
  boxrule=.5pt,arc=1.2mm,left=2.5mm,right=2.5mm,top=1.4mm,bottom=1.4mm,
  title={\sffamily\bfseries Richiamo teorico essenziale: #1},fonttitle=\sffamily\bfseries
}
\newtcolorbox{formulachiave}[1]{
  enhanced,breakable,colback=IngPaleGold,colframe=IngGold,
  boxrule=.65pt,arc=1.5mm,left=2.5mm,right=2.5mm,top=1.5mm,bottom=1.5mm,
  title={\sffamily\bfseries Formula chiave: #1},fonttitle=\sffamily\bfseries
}

\newcommand{\prioritaalta}{\textcolor{IngRed}{\sffamily\bfseries Priorità alta}}
\newcommand{\prioritamedia}{\textcolor{IngGold}{\sffamily\bfseries Priorità media}}
\newcommand{\estensione}{\textcolor{IngGray}{\sffamily\bfseries Estensione}}
\newcommand{\dato}[1]{\textbf{Dato:} #1}
\newcommand{\incognita}[1]{\textbf{Incognita:} #1}
\newcommand{\verifica}[1]{\textbf{Verifica:} #1}

\newcommand{\SetupFormularioHeaders}{%
  \clearpairofpagestyles
  \automark[section]{chapter}
  \ihead{\headmark}
  \ohead{\FormularioBreve\ · \FormularioVersione}
  \ifoot{\href{\SitoURL}{ingegnerismo.it}}
  \ofoot{\thepage}
  \pagestyle{scrheadings}
}
