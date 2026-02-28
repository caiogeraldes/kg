\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kg}[2026/02/27 Classe para diagramação de KGB]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass[11pt,extrafontsizes]{memoir}
\setcolsepandrule{5em}{0pt}

% set \clubpenalty, etc. to distinctive values for use
% in tracing page breaks. These values are chosen so that
% no single penalty will absolutely prohibit a page break, but
% certain combinations of two or more will.
\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991
% Reiterate the default value of \redisplaypenalty, for
% completeness.
% Set postdisplaypenalty to a fairly high value to discourage a
% page break between a display and a widow line at the end of a
% paragraph.
\predisplaypenalty=10000
\postdisplaypenalty=1549
% And then \displaywidowpenalty should be at least as high as
% \postdisplaypenalty, otherwise in a situation where two displays
% are separated by two lines, TeX will prefer to break between the
% two lines, rather than before the first line.
\displaywidowpenalty=1602

\setparaindent{0em}%
\setbeforeparaskip{0.25em}%
\setafterparaskip{-1em}%
\setlength{\footmarkwidth}{0.5em}
\setlength{\footmarksep}{0em}
\setlength{\footparindent}{0em}
\footmarkstyle{\textsuperscript{#1}\hspace{0.5em}}

% Fontes, línguas, unicode
\RequirePackage{ccicons}
\RequirePackage{graphicx}
\RequirePackage{csquotes}
\RequirePackage{fontspec}
\RequirePackage{emoji}
\RequirePackage{mathpazo}
\RequirePackage{hyphenat}
\RequirePackage{tracklang}
\TrackLangShowWarningsfalse%

\RequirePackage[main=german, bidi=basic]{babel}
\newfontfamily\cartafont{Goudy Old Style Regular.ttf}[
	Extension=.ttf,
	ItalicFont=Goudy Old Style Regular Italic,
	BoldFont=Goudy Old Style Extra Bold,
]

\newfontfamily\secondarygreek{Gentium Plus}
\newfontfamily\thirdiarygreek{IFAO-Grec-Unicode}
\newfontfamily\quaternarygreek{Pecita}
\newfontfamily\epichoricfont{Brill-Epichoric}[Scale=1.2]
\newcommand{\epigraphic}[1]{{\epichoricfont{}#1}}
\defaultfontfeatures{Renderer=Harfbuzz}
\setmainfont{Gentium Book Plus}


\babelfont[german]{rm}[Script=Latin]{Gentium Book Plus}
\babelfont[german]{sf}{Noto Sans}
\babelfont[german]{tt}[Scale=0.8]{Mononoki Nerd Font}
\babeltags{de=german}

\babelprovide[import]{brazilian}
\babeltags{bra=brazilian}

\babelfont[brazil]{rm}[Script=Latin]{Gentium Book Plus}
\babelfont[brazil]{sf}{Noto Sans}
\babelfont[brazil]{tt}[Scale=0.8]{Mononoki Nerd Font}

\babelprovide[import, onchar=ids fonts letters]{ancientgreek}
\babelfont[ancientgreek]{rm}[BoldFont=Gentium Book Plus Bold]{Brill}
\babelfont[ancientgreek]{sf}[Scale=0.8]{Noto Sans Bold}
\babeltags{grc = ancientgreek}

\babelprovide[import]{hebrew}
\babelfont[hebrew]{rm}[Scale=0.8]{Ezra SIL}

\babelprovide[]{ipa}
\babelfont[ipa]{rm}[Scale=0.8]{Noto Sans Bold}
\babelfont[ipa]{sf}[Scale=0.8]{Noto Sans Bold}
\newcommand{\ipa}[1]{{\sffamily\foreignlanguage{ipa}{#1}}}

\babelprovide[]{syntax}
\babelfont[syntax]{rm}[Scale=0.85]{Noto Sans}
\babeltags{syntax = syntax}

\babelprovide{hittite}
\babelfont[hittite]{rm}{UllikummiA}

\babelprovide[import,onchar=ids fonts]{sanskrit}
\babelfont[sanskrit]{rm}[Scale=1]{AdishilaLetterpressHeavy}
\babelfont[sanskrit]{sf}[Scale=1]{AdishilaLetterpressHeavy}

\babelprovide[import, onchar=ids fonts letters]{armenian}
\babelfont[armenian]{rm}[Scale=0.8]{Noto Serif Armenian}

\babelprovide[]{linearb}
\babelfont[linearb]{rm}[]{Noto Sans Linear B}

\RequirePackage{microtype}
\RequirePackage{longtable}
\RequirePackage{makecell}
\RequirePackage{lipsum}
\RequirePackage{paralist}
\setdefaultleftmargin{\parindent}{\parindent}{\parindent}{\parindent}{\parindent}{\parindent}

\let\printindex\undefined
\RequirePackage{bibliocaiera}
\RequirePackage{xcolor}
\definecolor{green}{RGB}{16, 87, 87} % rgb(16,87,87)

% Tikz
\RequirePackage{tikz} %for all basic options
\RequirePackage{tikz-qtree} %for simple tree syntax
\RequirePackage{tree-dvips}
\usepgflibrary{arrows} %for arrow endings
\usetikzlibrary{positioning,shapes.multipart} %for structured nodes
\usetikzlibrary{tikzmark}

\RequirePackage[pdfusetitle]{hyperref}
\hypersetup{%
	colorlinks=true, % false: boxed links; true: colored links
	linkcolor=green,  % color of internal links
	citecolor=green,  % color of links to bibliography
	filecolor=green,  % color of file links
	urlcolor=green,
}

% (Auth.,) W. Passage
\renewcommand{\passagem}[1]{\glslink{idx.#1}{\ifglshasparent{\glsentryparent{idx.#1}}{\glsxtrusefield{\glsentryparent{\glsentryparent{idx.#1}}}{useri}, }{}\glsxtrusefield{\glsentryparent{idx.#1}}{useri}, \gls{idx.#1}}}

% (Author,) Work, Passage
\newcommand{\passagemb}[1]{\glslink{idx.#1}{\ifglshasparent{\glsentryparent{idx.#1}}{\glsxtrusefield{\glsentryparent{\glsentryparent{idx.#1}}}{userii},
		}{}\glsxtrusefield{\glsentryparent{idx.#1}}{userii},
		\gls{idx.#1}}}

% Auth, Work
\newcommand{\authwork}[1]{\glslink{idx.#1}{\glsxtrusefield{\glsentryparent{#1}}{useri},
		\glsxtrshort{#1}}}

% Author[decl] (Work, passage)
\newcommand{\passagemc}[2]{\glslink{idx.#1}{{\glsxtrusefield{\glsentryparent{\glsentryparent{idx.#1}}}{userii}#2
				(\glsxtrusefield{\glsentryparent{idx.#1}}{userii}, \gls{idx.#1})}}}

% Author[decl] (passage)
\newcommand{\passagemd}[2]{{\glsxtrusefield{\glsentryparent{idx.#1}}{userii}#2
			(\gls{idx.#1})}}

% Wo. Passage
\newcommand{\passageme}[1]{\glslink{idx.#1}{\glsxtrusefield{\glsentryparent{idx.#1}}{useri}, \gls{idx.#1}}}

% Auth. (W., passage)
\newcommand{\passagemf}[1]{\glslink{idx.#1}{{\glsxtrusefield{\glsentryparent{\glsentryparent{idx.#1}}}{useri}
				(\glsxtrusefield{\glsentryparent{idx.#1}}{useri}, \gls{idx.#1})}}}

% Author long
\newcommand{\authorlong}[1]{\glsxtrlong{#1}}
\newcommand{\authorlongdecl}[2]{\glslink{idx.#1}{\glsxtrlong{#1}#2}}

% Lang long
\newcommand{\Langlong}[1]{\glsxtrlong{#1}}
\newcommand{\Langlongdecl}[2]{\glslink{idx.#1}{\glsxtrlong{#1}#2}}
\newcommand{\langlong}[1]{{\glsxtrusefield{#1}{useriii}}}
\newcommand{\langlongdecl}[2]{\glslink{idx.#1}{\glsxtrusefield{#1}{useriii}#2}}



\newcommand\NumToNameMasc[1]{%
	\ifcase#1\relax % case 0
	\or Erster\or Zweiter\or Dritter%
	\else Not implemented\fi}
\newcommand\NumToNameNeut[1]{%
	\ifcase#1\relax % case 0
	\or Erstes\or Zweites\or Drittes%
	\else Not implemented\fi}



% Book -> Teil
\nobookblankpage%
\renewcommand*{\beforebookskip}{}
\renewcommand{\midbookskip}{\par}
\renewcommand{\afterbookskip}{\bigskip}
\renewcommand{\bookpageend}{%
	\afterbookskip%
}
\renewcommand\printbooknum{%
	\par\booknamefont\enspace%
	\NumToNameMasc{\arabic{book}}\space\bookname%
	\/\enspace}
\setlocalecaption{german}{book}{Teil}
\renewcommand\booknamenum{}
\renewcommand\printbookname{}
\renewcommand{\booknamefont}{\LARGE\scshape}
\renewcommand{\booknumfont}{\LARGE\scshape}
\renewcommand{\booktitlefont}{\HUGE\bfseries\scshape}
% Part -> Abschnitt
\makeatletter
\renewcommand{\@setuppart}{%
	\if@twocolumn
		\onecolumn
		\@tempswatrue
	\else
		\@tempswafalse
	\fi
	\beforepartskip}
\makeatother
\nopartblankpage%
\renewcommand*{\beforepartskip}{\bigskip\bigskip}
\renewcommand{\midpartskip}{\par}
\renewcommand{\afterpartskip}{\bigskip\bigskip}
\renewcommand{\partpageend}{%
	\afterpartskip%
}
\renewcommand\printpartnum{%
	\par\partnamefont\enspace%
	\NumToNameMasc{\arabic{part}}\space\partname%
	\/\enspace}
\setlocalecaption{german}{part}{Abschnitt}
\renewcommand\partnamenum{}
\renewcommand\printpartname{}
\renewcommand{\partnamefont}{\Large\scshape}
\renewcommand{\partnumfont}{\Large\scshape}
\renewcommand{\parttitlefont}{\LARGE\bfseries\scshape}

% Chapter
\newcommand\chap[1]{%
	\chapter*[#1]{#1}%
	\addcontentsline{toc}{chapter}{#1}}
\renewcommand{\chaptitlefont}{\centering\LARGE\bfseries\scshape}
\renewcommand{\chapnamefont}{\centering\Large\scshape}
\renewcommand{\chapnumfont}{\centering\Large\scshape}
\renewcommand{\clearforchapter}{}
\renewcommand{\afterchapternum}{\par\midchapskip}
% \chapterstyle{hangnum}
\setlength{\beforechapskip}{2\bigskipamount}
\setlength{\afterchapskip}{\bigskipamount}
\renewcommand{\afterchaptertitle}{\par\vskip \afterchapskip\bigskip}
\renewcommand\printchapternum{%
	\par\chapnamefont\enspace%
	\ifanappendix%
		\appendixname\space\thechapter%
	\else%
		\NumToNameMasc{\thechapter}\space\chaptername%
	\fi%
	\/\enspace}
\renewcommand*{\chaptername}{Abschnitt}
\renewcommand\chapternamenum{}
\renewcommand\printchaptername{}

% Section
\renewcommand{\secheadstyle}{\centering\bfseries}
\setsecnumdepth{subparagraph}
\renewcommand{\thesection}{\S\arabic{section}}
% \setsechook{\setsecnumformat{\csname the#1\endcsname.\quad}}
\setsechook{\setsecnumformat{\csname the##1\endcsname.\space}}
\newcommand{\secref}[1]{\ref*{#1}}

% Paragraph
\renewcommand{\theparagraph}{\arabic{paragraph}}
\renewcommand{\paragraphautorefname}{\S\arabic{section}.\arabic{paragraph}}
\setparahook{\setsecnumformat{\csname the##1\endcsname.\space}}
\newcommand{\pararef}[2]{\hyperref[#2]{\ref*{#1}.\ref*{#2}}}
\renewcommand{\thesubparagraph}{Anmerk. \arabic{subparagraph}}
\setsubparaindent{0em}%
\makeatletter
\setbeforesubparaskip{0em}%
\makeatother
\setaftersubparaskip{0em}%
\setsubparaheadstyle{\small\bfseries}

% ToC
\settocdepth{section}

\newcommand{\colofao}[0]{
	\pagestyle{empty}
	\cleartoevenpage%
	\SingleSpacing%
	\null\vfill
	\begin{adjustwidth}{14em}{1.21em}
		\begin{flushleft}
			\small
			Esse documento foi diagramado usando o sistema de diagramação
			\href{https://lualatex.org}{Lua\TeX} mantido por Manuel Pégourié-Gonnard.\\
			As fontes utilizadas foram: {Gentium Book Plus (texto latino)};
			\foreignlanguage{ancientgreek}{Brill} (texto grego) e
			\foreignlanguage{ancientgreek}{Brill Epichoric} \epigraphic{ΕΠΙΧΩΡΙΟΣ}
			(texto de inscrições); {\thirdiarygreek{}\textsc{IFAO-Grec}} (notação
			métrica) e \ipa{Noto Sans Bold} (complementos fonológicos).
			\mbox{O texto está em tamanho 12/14,5pt}.\par

			{\foreignlanguage[date]{brazilian}{\today}.


				\ccbyncsa%
			}
		\end{flushleft}
	\end{adjustwidth}
}


% Páginas especiais
\newlength{\linespace}
\setlength{\linespace}{\baselineskip} % current equivalent of \onelineskip
\newlength{\toptafiddle} \setlength{\toptafiddle}{2\linespace}
\newlength{\bottafiddle} \setlength{\bottafiddle}{0pt}
\newlength{\topfiddle}
\setlength{\topfiddle}{\toptafiddle}
\newlength{\botfiddle}
\setlength{\botfiddle}{\onelineskip}
