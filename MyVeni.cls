\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MyVeni}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}


\ProcessOptions

\LoadClass{article}

%==========================colors==============================
\usepackage[usenames,dvipsnames]{xcolor}

%==========================languages===========================
\usepackage[english]{babel}

%==========================symbols=============================

\usepackage{eurosym,amsmath,wasysym}

%==========================section layout=======================

\usepackage{sectsty} % Section-header style

\usepackage[compact]{titlesec}

\usepackage{tikz}
\usetikzlibrary{shapes.misc}
\newcommand\sectionbar{%  Grey bar, no number, black border - Section
  \tikz[baseline,trim left=2.5cm,trim right=2.5cm] {
    \fill [black!60] (2.5cm,-0.8ex) rectangle (\textwidth+2.5cm,1.9ex);  % fill rectangle
    \draw [thick, black] (2.5cm,-0.8ex) rectangle (\textwidth+2.5cm,1.9ex);  % draw border
  }%
}

\setcounter{secnumdepth}{4}

\titleformat{\section}[hang]{\large\bfseries\sffamily\color{white}}{\sectionbar}{\wordsep}{}
\titleformat{\subsection}[hang]{\large\bfseries\sffamily}{\thesubsection}{\wordsep}{}
\titleformat{\subsubsection}[hang]{\normalsize\sffamily\bfseries}{\thesubsubsection}{\wordsep}{}
\titleformat{\paragraph}[hang]{\small\sffamily\bfseries}{\theparagraph}{\wordsep}{}

\titlespacing*{\section} {0pt}{1.3ex plus .3ex minus .1ex}{1ex plus .1ex}[0pt]	
% vertical spacing before and after section
\titlespacing*{\subsection} {0pt}{1ex plus .3ex minus .1ex}{.8ex plus .1ex}[0pt]
% vertical spacing before and after subsection
\titlespacing*{\subsubsection}{0pt}{.8ex plus .3ex minus .1ex}{.5ex plus
.1ex}[0pt] 	% vertical spacing before and after subsubsection
\titlespacing*{\paragraph} {0pt}{.5ex plus .3ex minus .1ex}{.3em}[0pt]
% vertical spacing before and after paragraph

% Redefine section labels
\renewcommand{\thesubsection}{\arabic{section}\alph{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{section}\alph{subsection}.\arabic{subsubsection}}
\renewcommand{\theparagraph}{\arabic{section}\alph{subsection}.\arabic{subsubsection}\alph{paragraph}}

%========================page layout==============================

% Use this to print on A4:
\usepackage[a4paper, top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}
\setlength{\textheight}{23.5cm}
\setlength{\headheight}{51pt}
\linespread{0.95}  % Distance between lines - default 1.0

%==========================paragraph layout====================

\usepackage{parskip} 			%whitespace before/after each paragraph
\setlength{\parskip}{0.1cm} 	%length of whitespace before/after each paragraph
\setlength{\parindent}{0.5cm} 	%length of indentation at the start of each paragraph
\widowpenalty=300
\clubpenalty=300

%=========================lists================================
\usepackage{enumitem} 	%package to modify enumerate and itemize lists
\setlist{nosep} 		%no separation between list and the rest of the text
\setlist{noitemsep} 	%no separation between items
\newcounter{enumTemp} 	%new counter to create continuous counting over multiple lists

%=========================fonts=================================
%\usepackage{courier}
%\usepackage{chancery}
%\usepackage{cmbright}

\renewcommand*\rmdefault{ptm}
%bch ppl pbk ptm lmr cmr pnc
\renewcommand*\sfdefault{phv}
%cmss lmss pag
\usepackage[T1]{fontenc}

%========================textboxes============================
\usepackage{framed}

%========================hyperlinks============================

\usepackage{hyperref}
\hypersetup{
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={},    		% title
    pdfauthor={},    		% author
    pdfcreator={},   		% creator of the document
    pdfproducer={Producer}, % producer of the document
    pdfkeywords={}, 		% list of keywords
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,       	% false: boxed links; true: colored links
    linkcolor=PineGreen,    % color of internal links (change box color
							% with linkbordercolor)
    citecolor=PineGreen,    % color of links to bibliography
    filecolor=PineGreen,    % color of file links
    urlcolor=PineGreen      % color of external links
    % other options: MidnightBlue BrickRed OliveGreen Mahogany 
	% Maroon RawSienna RedViolet Periwinkle ProcessBlue
    % RoyalPurple Violet CornflowerBlue Mulberry 
    % RoyalBlue Sepia WildStrawberry PineGreen
}

%--------------------layout for reference list-------------------

\usepackage[
backend=bibtex,
citestyle=numeric-comp,
sortcites=true,
doi=true,
isbn=false,
url=true,
eprint=false,
uniquename=init,
bibstyle=numeric,
maxnames=99,
natbib=true,
sorting=nyt,
firstinits=true]{biblatex}
% natbib is the backend, not biber, citations are sorted on name, then year, then title

\renewcommand{\finalnamedelim}{~\&~}

\DeclareNameAlias{default}{last-first}

\renewcommand*{\newunitpunct}{\addcomma\space} % ik gebruik komma's in de referentielijst om velden van elkaar te scheiden

\renewbibmacro*{volume+number+eid}{
  \setunit*{\addcomma\space}
  \printfield{volume}
%  \setunit*{\adddot}
  \setunit*{\addcomma\space}
  \printfield{number}
  \setunit{\addcomma\space}
  \printfield{eid}}

\DeclareFieldFormat[article]{volume}{\bibstring{volume}~#1} % volume of a journal
\DeclareFieldFormat[article]{number}{\bibstring{number}~#1} % number of a journal

\renewbibmacro*{issue+date}{
  \setunit*{\addcomma\space}
%  \printtext[parens]{
    \iffieldundef{issue}
      {\usebibmacro{date}}
      {\printfield{issue}
       \setunit*{\addspace}
%       \usebibmacro{date}}}
       \usebibmacro{date}}
  \newunit}

\renewbibmacro*{journal+issuetitle}{
  \usebibmacro{journal}
  \setunit*{\addspace}
  \iffieldundef{series}
    {}
    {\newunit
     \printfield{series}
     \setunit{\addspace}}
  \usebibmacro{volume+number+eid}
  \newunit
   \usebibmacro{issue+date}
%  \setunit{\addcolon\space}
%  \usebibmacro{issue}
  \newunit}
  
\DeclareFieldFormat{sentencecase}{\MakeSentenceCase{#1}}

\renewbibmacro*{title}{
  \ifthenelse{\iffieldundef{title}\AND\iffieldundef{subtitle}}
    {}
    {\ifthenelse{\ifentrytype{article}\OR\ifentrytype{inbook}
      \OR\ifentrytype{incollection}\OR\ifentrytype{inproceedings}
      \OR\ifentrytype{inreference}}
      {\printtext[title]{
        \printfield[sentencecase]{title}
        \setunit{\subtitlepunct}
        \printfield[sentencecase]{subtitle}}}
      {\printtext[title]{
        \printfield[titlecase]{title}
        \setunit{\subtitlepunct}
        \printfield[titlecase]{subtitle}}}
     \newunit}
  \printfield{titleaddon}}
  
\DeclareBibliographyDriver{misc}{
\printnames{author}
\newunit\newblock
\printfield{title}
\newunit\newblock
\printfield{journaltitle}
\newunit\newblock
\printfield{month}
\printfield{year}
\newunit\newblock
\printfield{url}
\setunit{, Retrieved on: }\newblock
\printfield{urlday}
\setunit{/}
\printfield{urlmonth}
\setunit{/}
\printfield{urlyear}
\finentry}

\DeclareFieldFormat[misc]{title}{\mkbibquote{#1}}

\AtEveryBibitem{\clearlist{language}} % clears language
\AtEveryBibitem{\clearfield{note}}    % clears notes

\AtEveryBibitem{
  \ifentrytype{misc}{
  }{
    \clearfield{url}
    \clearfield{urlyear}
  }
}

%------make an author name appear boldface in reference list------------
\newcommand{\makeauthorbold}[1]{
\DeclareNameFormat{author}{
  \ifnumequal{\value{listcount}}{1}
    {\ifnumequal{\value{liststop}}{1}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{##1\addcomma\addspace ##4\addcomma\isdot}}{##1\addcomma\addspace ##4\addcomma\isdot}}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{##1\addcomma\addspace ##4}}{##1\addcomma\addspace ##4}}}
    {\ifnumless{\value{listcount}}{\value{liststop}}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{\addcomma\addspace ##1\addcomma\addspace ##4}}{\addcomma\addspace ##1\addcomma\addspace ##4}}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{\addcomma\addspace ##1\addcomma\addspace ##4\addcomma\isdot}}{\addcomma\addspace ##1\addcomma\addspace ##4\addcomma\isdot}}
    }
}
}

%ADD YOUR OWN LAST NAME IN THE COMMAND BELOW TO MAKE YOUR NAME APPEAR BOLD TEXT IN CITATION LIST!

\makeauthorbold{YOURNAME}

%------------NEW COMMAND TO PRINT FULL CITATIONS IN TEXT------------

\DeclareCiteCommand{\fullcite}
  {\usebibmacro{prenote}}
  {\usedriver
     {\defcounter{minnames}{6}
      \defcounter{maxnames}{6}}
     {\thefield{entrytype}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

%--COMMAND TO PREVENT CITATION FROM APPEARING IN REFERENCE LIST----

\DeclareBibliographyCategory{donotlist}
\newcommand{\mybibexclude}[1]{\addtocategory{donotlist}{#1}}
%use \mybibexclude{CITATION YOU WANT TO REMOVE FROM REFERENCE LIST}

%=====================tables and figures===========================

\usepackage{pgf,float,floatrow,graphicx,wrapfig,epstopdf}

%------extra commands to add space before and after rows----------

\newcommand\T{\rule{0pt}{2.4ex}} 
\newcommand\B{\rule[-1.3ex]{0pt}{0pt}}

%-----------------create cells spanning multiple columns-----------
\usepackage{multicol}

%-----------------create cells spanning multiple rows--------------
\usepackage{multirow}

%-----------------add shaded cells to tables------------------------
\usepackage{colortbl}

%-----------------subfolder where figures are located--------------
\graphicspath{{Figures/}}


%-----------------caption rename----------------------------------
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

%=======================headers and footers====================

\usepackage{fancyhdr}
\usepackage{lastpage}

%--MAKE SURE YOU ADJUST THE TYPE OF SCHEME AND YEAR OF APPLICATION HERE--------

\pagestyle{fancy}
\lhead{\footnotesize\sffamily \textbf{Vernieuwingsimpuls \\ Innovational
Research Incentives Scheme\\ Grant application form YEAR}\\\emph{Please refer to Explanatory Notes
when completing this form}}

\rhead{\includegraphics[width=7cm]{NWO-logo.png}\\\footnotesize \sffamily \textbf{RUBICON/VENI/VIDI/VICI scheme}}

\cfoot{\footnotesize\thepage}
\renewcommand{\headrulewidth}{2pt}

\endinput