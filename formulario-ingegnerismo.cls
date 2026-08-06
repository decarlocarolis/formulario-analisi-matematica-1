\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formulario-ingegnerismo}[2026/08/06 v1.2 Classe grafica dei formulari di ingegnerismo.it]

% Classe di base e lingua del documento.
\LoadClass[11pt,a4paper,oneside,open=any,headings=normal,parskip=half,numbers=noenddot]{scrbook}
\RequirePackage[italian]{babel}

% Tipografia scientifica.
\RequirePackage{amsmath,amssymb,mathtools}
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
% Fallback mirato per delimitatori estensibili: evita giunzioni visibili nelle parentesi graffe.
\setmathfont[range={\lbrace,\rbrace}]{STIXTwoMath-Regular.otf}
\RequirePackage{microtype}

% Impaginazione e strumenti grafici.
\RequirePackage{geometry}
\geometry{top=20mm,bottom=22mm,inner=20mm,outer=20mm,headsep=7mm,footskip=11mm}
\RequirePackage{array,booktabs,longtable,tabularx,multirow,calc}
\RequirePackage{varwidth}
\RequirePackage{enumitem}
\RequirePackage[table]{xcolor}
\RequirePackage[most]{tcolorbox}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{hyperref}
\RequirePackage{bookmark}
\RequirePackage{xurl}
\RequirePackage{etoolbox}

% Palette istituzionale ricavata dal logo di ingegnerismo.it.
\definecolor{IngBlu}{HTML}{006FB9}
\definecolor{IngBluScuro}{HTML}{00477A}
\definecolor{IngGiallo}{HTML}{FFEE84}
\definecolor{IngGialloScuro}{HTML}{9A8200}
\definecolor{IngNero}{HTML}{1D1D1B}
\definecolor{IngGrigio}{HTML}{666665}
\definecolor{IngGrigioMedio}{HTML}{A4A3A3}
\definecolor{IngLinea}{HTML}{D7DEE3}
\definecolor{IngBluPallido}{HTML}{F1F7FB}
\definecolor{IngBluPallidoIntenso}{HTML}{E6F2F9}
\definecolor{IngGialloPallido}{HTML}{FFFBE8}
\definecolor{IngGrigioPallido}{HTML}{F4F5F5}
\definecolor{IngBianco}{HTML}{FFFFFF}
% Colori semantici: il marchio resta blu/giallo; errore e verifica hanno codici distinti.
\definecolor{IngErrore}{HTML}{9E3D32}
\definecolor{IngErrorePallido}{HTML}{FFF3F1}
\definecolor{IngVerifica}{HTML}{2F6B57}
\definecolor{IngVerificaPallido}{HTML}{F0F7F4}
\definecolor{IngAzzurroPallido}{HTML}{EDF6FB}

\color{IngNero}
\pagecolor{IngBianco}
\frenchspacing

% Gerarchia tipografica.
\setkomafont{chapter}{\normalfont\sffamily\bfseries\fontsize{23}{27}\selectfont\color{IngBluScuro}}
\setkomafont{section}{\normalfont\sffamily\bfseries\Large\color{IngBluScuro}}
\setkomafont{subsection}{\normalfont\sffamily\bfseries\large\color{IngBlu}}
\setkomafont{subsubsection}{\normalfont\sffamily\bfseries\normalsize\color{IngGrigio}}
\setkomafont{part}{\normalfont\sffamily\bfseries\color{IngBluScuro}}
\setkomafont{caption}{\small\sffamily\color{IngGrigio}}
\setkomafont{pageheadfoot}{\footnotesize\sffamily\color{IngGrigio}}
\setkomafont{chapterentry}{\sffamily\bfseries\color{IngBluScuro}}
\setkomafont{chapterentrypagenumber}{\sffamily\bfseries\color{IngBlu}}
\setkomafont{partentry}{\sffamily\bfseries\color{IngBluScuro}}

\RedeclareSectionCommand[beforeskip=0pt,afterskip=1.15\baselineskip]{chapter}
\RedeclareSectionCommand[beforeskip=1.45\baselineskip,afterskip=.58\baselineskip]{section}
\RedeclareSectionCommand[beforeskip=1.15\baselineskip,afterskip=.42\baselineskip]{subsection}

% Numero di capitolo compatto e linea gialla di riconoscimento.
\renewcommand*{\chapterformat}{%
  \colorbox{IngBluScuro}{%
    \parbox[c][11mm][c]{13mm}{\centering\color{IngBianco}\sffamily\bfseries\Large\thechapter}%
  }\hspace{3.5mm}%
}
\makeatletter
\renewcommand*{\chapterlinesformat}[3]{%
  \@hangfrom{#2}{#3}%
  \par\nobreak
  \vspace{2.2mm}%
  \noindent{\color{IngGiallo}\rule{\dimexpr\linewidth-1em\relax}{1.6pt}}%
}
\makeatother
\renewcommand*{\sectionformat}{\textcolor{IngBlu}{\thesection\autodot}\enskip}
\renewcommand*{\subsectionformat}{\textcolor{IngBluScuro}{\thesubsection\autodot}\enskip}

% Regole di composizione generali.
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}
\setlength{\parindent}{0pt}
\setlength{\parskip}{.46em plus .15em minus .1em}
\setlength{\LTpre}{.75em}
\setlength{\LTpost}{.9em}
\setlength{\tabcolsep}{5.3pt}
\renewcommand{\arraystretch}{1.22}
\setlength{\jot}{5pt}
\setlength{\abovedisplayskip}{.76\baselineskip plus .18\baselineskip minus .12\baselineskip}
\setlength{\belowdisplayskip}{.76\baselineskip plus .18\baselineskip minus .12\baselineskip}
\setlength{\abovedisplayshortskip}{.5\baselineskip}
\setlength{\belowdisplayshortskip}{.6\baselineskip}
\setlist{nosep,leftmargin=*}
\setlist[enumerate,1]{label=\textcolor{IngBluScuro}{\bfseries\arabic*.},itemsep=.32em,topsep=.38em}
\setlist[itemize,1]{label=\textcolor{IngBlu}{\textbullet},itemsep=.23em,topsep=.34em}
\AtBeginEnvironment{longtable}{\small\rowcolors{2}{IngBluPallido}{IngBianco}\arrayrulecolor{IngLinea}}
\AtBeginEnvironment{tabularx}{\small\rowcolors{2}{IngBluPallido}{IngBianco}\arrayrulecolor{IngLinea}}

\allowdisplaybreaks[2]
\raggedbottom
\emergencystretch=3em

% Collegamenti e metadati PDF.
\hypersetup{
  colorlinks=true,
  linkcolor=IngBluScuro,
  urlcolor=IngBlu,
  citecolor=IngBluScuro,
  pdfborder={0 0 0},
  bookmarksnumbered=true,
  bookmarksopen=true,
  hypertexnames=false
}
\urlstyle{same}

% Comandi di compatibilità con il sorgente storico.
\newcommand{\listaCompatta}{}
\newcommand{\real}[1]{#1}

% Marchio e componenti di identità visiva.
\newcommand{\LogoIngegnerismo}[1][24mm]{%
  \includegraphics[width=#1]{risorse/marchio/logo-ingegnerismo-bandiera.pdf}%
}
\newcommand{\FirmaIngegnerismo}{%
  \textcolor{IngBlu}{\rule{1.5mm}{1.5mm}}\hspace{1.2mm}%
  \href{\SitoURL}{\textcolor{IngBluScuro}{\sffamily\bfseries ingegnerismo.it}}%
}

% Stile comune dei riquadri: testata integrata, bordi sobri e codifica semantica stabile.
\tcbset{
  formulario/base/.style={
    enhanced,
    breakable,
    boxrule=.55pt,
    arc=1.35mm,
    outer arc=1.35mm,
    left=3.2mm,
    right=3.2mm,
    top=2.8mm,
    bottom=2.7mm,
    lefttitle=3.2mm,
    righttitle=3.2mm,
    toptitle=1.45mm,
    bottomtitle=1.35mm,
    titlerule=0pt,
    before skip=.88\baselineskip,
    after skip=.82\baselineskip,
    fonttitle=\sffamily\bfseries\small,
    coltext=IngNero
  }
}

% Blu istituzionale: orientamento e obiettivo.
\newtcolorbox{obiettivocapitolo}[1]{
  formulario/base,
  colback=IngBluPallido,
  colframe=IngBluScuro,
  colbacktitle=IngBluScuro,
  coltitle=IngBianco,
  borderline west={2.4pt}{0pt}{IngBluScuro},
  title={Obiettivo operativo — #1}
}
% Blu primario: selezione del metodo.
\newtcolorbox{sceltametodo}[1]{
  formulario/base,
  colback=IngAzzurroPallido,
  colframe=IngBlu,
  colbacktitle=IngBlu,
  coltitle=IngBianco,
  borderline west={2.4pt}{0pt}{IngBlu},
  title={Scelta del metodo — #1}
}
% Procedura: testata chiara per distinguerla dai box di orientamento.
\newtcolorbox{proceduraesame}[1]{
  formulario/base,
  colback=IngBianco,
  colframe=IngBlu!70!IngBluScuro,
  colbacktitle=IngBluPallidoIntenso,
  coltitle=IngBluScuro,
  borderline west={2.8pt}{0pt}{IngBlu},
  title={Procedura d'esame — #1}
}
% Rosso attenuato: errore o rischio, senza confonderlo con una formula chiave.
\newtcolorbox{errorefrequente}[1]{
  formulario/base,
  colback=IngErrorePallido,
  colframe=IngErrore,
  colbacktitle=IngErrore,
  coltitle=IngBianco,
  borderline west={2.8pt}{0pt}{IngErrore},
  title={Errore frequente — #1}
}
% Verde attenuato: verifica conclusiva e controllo positivo.
\newtcolorbox{controllofinale}[1]{
  formulario/base,
  colback=IngVerificaPallido,
  colframe=IngVerifica,
  colbacktitle=IngVerifica,
  coltitle=IngBianco,
  borderline west={2.8pt}{0pt}{IngVerifica},
  title={Controllo finale — #1}
}
% Grigio neutro: richiamo teorico e contesto.
\newtcolorbox{teoriaessenziale}[1]{
  formulario/base,
  colback=IngGrigioPallido,
  colframe=IngGrigioMedio,
  colbacktitle=IngGrigio,
  coltitle=IngBianco,
  borderline west={2.4pt}{0pt}{IngGrigioMedio},
  title={Richiamo teorico essenziale — #1}
}
% Giallo del marchio: relazione da memorizzare o usare direttamente.
\newtcolorbox{formulachiave}[1]{
  formulario/base,
  colback=IngGialloPallido,
  colframe=IngGialloScuro,
  colbacktitle=IngGiallo,
  coltitle=IngNero,
  borderline west={2.8pt}{0pt}{IngGialloScuro},
  title={Formula chiave — #1}
}

% Etichette operative inline.
\newcommand{\EtichettaGialla}[1]{%
  \begingroup\setlength{\fboxsep}{2.2pt}%
  \colorbox{IngGiallo}{\textcolor{IngNero}{\sffamily\bfseries\footnotesize #1}}%
  \endgroup
}
\newcommand{\EtichettaBlu}[1]{%
  \begingroup\setlength{\fboxsep}{2.2pt}%
  \colorbox{IngBluScuro}{\textcolor{IngBianco}{\sffamily\bfseries\footnotesize #1}}%
  \endgroup
}
\newcommand{\EtichettaGrigia}[1]{%
  \begingroup\setlength{\fboxsep}{2.2pt}%
  \colorbox{IngGrigioPallido}{\textcolor{IngGrigio}{\sffamily\bfseries\footnotesize #1}}%
  \endgroup
}
\newcommand{\prioritaalta}{\EtichettaGialla{Priorità alta}}
\newcommand{\prioritamedia}{\EtichettaBlu{Priorità media}}
\newcommand{\estensione}{\EtichettaGrigia{Estensione}}
\newcommand{\dato}[1]{\textbf{Dato:} #1}
\newcommand{\incognita}[1]{\textbf{Incognita:} #1}
\newcommand{\verifica}[1]{\textbf{Verifica:} #1}

% Pagina di apertura delle parti della collana.
\newcommand{\ParteFormulario}[2]{%
  \cleardoublepage
  \refstepcounter{part}%
  \phantomsection
  \addcontentsline{toc}{part}{\protect\numberline{\thepart}#1}%
  \pdfbookmark[0]{Parte \thepart: #1}{parte-\thepart}%
  \thispagestyle{empty}%
  \begin{tikzpicture}[remember picture,overlay]
    \fill[IngBianco] (current page.north west) rectangle (current page.south east);
    \fill[IngBluScuro] (current page.north west) rectangle ([xshift=15mm]current page.south west);
    \fill[IngBlu] ([xshift=15mm]current page.north west) rectangle ([xshift=18.5mm]current page.south west);
    \fill[IngGiallo] ([xshift=18.5mm]current page.north west) rectangle ([xshift=20mm]current page.south west);

    % Numero di parte come filigrana tipografica.
    \node[anchor=north east,text=IngBlu!7,font=\sffamily\bfseries\fontsize{118}{118}\selectfont]
      at ([xshift=-12mm,yshift=-8mm]current page.north east) {\thepart};

    % Titolo della parte.
    \node[anchor=north west,inner sep=0pt]
      at ([xshift=35mm,yshift=-40mm]current page.north west) {%
        \begin{minipage}{146mm}
          {\sffamily\bfseries\fontsize{10.5}{13}\selectfont\color{IngBlu}
            \MakeUppercase{Parte \thepart}\par}
          \vspace{4mm}
          {\raggedright\hyphenpenalty=10000\exhyphenpenalty=10000
            \sffamily\bfseries\fontsize{34}{38}\selectfont\color{IngBluScuro}#1\par}
          \vspace{5mm}
          {\color{IngGialloScuro}\rule{52mm}{2.1pt}\par}
        \end{minipage}%
      };

    % Sottotitolo con richiamo cromatico discreto.
    \node[anchor=north west,inner sep=0pt]
      at ([xshift=35mm,yshift=-105mm]current page.north west) {%
        \begin{minipage}{132mm}
          \begin{tcolorbox}[
            enhanced,
            colback=IngBianco,
            colframe=IngLinea,
            boxrule=.45pt,
            arc=1.4mm,
            borderline west={2.8pt}{0pt}{IngBlu},
            left=4mm,right=4mm,top=3.2mm,bottom=3.2mm
          ]
          {\raggedright\sffamily\fontsize{15.5}{20}\selectfont\color{IngGrigio}#2\par}
          \end{tcolorbox}
        \end{minipage}%
      };

    % Linea di base comune a metadati e marchio.
    \draw[IngLinea,line width=.6pt]
      ([xshift=35mm,yshift=38mm]current page.south west) --
      ([xshift=-14mm,yshift=38mm]current page.south east);

    % Riferimento al volume in basso a sinistra.
    \node[anchor=south west,inner sep=0pt]
      at ([xshift=35mm,yshift=14mm]current page.south west) {%
        \begin{minipage}{92mm}
          {\sffamily\small\color{IngBluScuro}\FormularioTitolo\par}
          \vspace{1.2mm}
          {\sffamily\footnotesize\color{IngGrigio}
            \FormularioVersione\quad\textcolor{IngGrigioMedio}{|}\quad\FormularioData\par}
        \end{minipage}%
      };

    % Firma editoriale in basso a destra.
    \node[anchor=south east,inner sep=0pt]
      at ([xshift=-14mm,yshift=13mm]current page.south east) {%
        \begin{minipage}{67mm}
          \raggedleft
          \LogoIngegnerismo[18mm]\hspace{2.6mm}%
          \raisebox{5.4mm}{\textcolor{IngBluScuro}{\sffamily\bfseries\fontsize{18}{20}\selectfont ingegnerismo.it}}
        \end{minipage}%
      };
  \end{tikzpicture}%
  \null
  \clearpage
}

% Numero di pagina nel colore di accento.
\newcommand{\NumeroPaginaFormulario}{%
  \tikz[baseline=(numero.base)]\node[
    fill=IngGiallo,text=IngBluScuro,
    rounded corners=.7mm,
    inner xsep=3.8pt,inner ysep=1.2pt,
    font=\sffamily\bfseries\footnotesize
  ] (numero) {\thepage};%
}

% Intestazioni e piè di pagina.
\newcommand{\ImpostaIntestazioniFormulario}{%
  \clearpairofpagestyles
  \automark[section]{chapter}
  \ihead{\headmark}
  \ohead{\textcolor{IngBluScuro}{\FormularioBreve}}
  \ifoot{\FirmaIngegnerismo}
  \cfoot{\textcolor{IngGrigio}{\FormularioVersione}}
  \ofoot{\NumeroPaginaFormulario}
  \KOMAoptions{headsepline=.45pt,footsepline=.30pt}
  \addtokomafont{headsepline}{\color{IngBlu!40}}
  \addtokomafont{footsepline}{\color{IngGrigioMedio!70}}
  \pagestyle{scrheadings}
}
