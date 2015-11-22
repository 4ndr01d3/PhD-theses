% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "harvard-thesis.cls",
%     version         = "0.4",
%     date            = "4 April 2012",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, harvard-thesis",
%     supported       = "send email to suchow@fas.harvard.edu",
%     docstring       = "A thesis class for a Harvard dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{harvard-thesis}[2012/04/05 v0.4 Harvard University Thesis Class]
\LoadClass[12pt, oneside, letterpaper]{book}


% Required packages
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{relsize}
\renewcommand*{\UrlFont}{\ttfamily\smaller\relax}

\hypersetup{
	linktocpage,
    colorlinks,
    citecolor=Crimson,
    filecolor=black,
    linkcolor=black,
    urlcolor=Crimson,
}

\RequirePackage[centertags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage[numbers, comma, sort&compress]{natbib}
\RequirePackage[small, md, sc]{titlesec}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}

% Appendix
\RequirePackage{pdfpages}
\RequirePackage{xparse}

%listings
\RequirePackage{listings}


% colors
\RequirePackage{color}
\definecolor{Crimson}{rgb}{0.6471, 0.1098, 0.1882}

\RequirePackage{url}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{1}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\setlength{\cftfignumwidth}{3em}

\renewcommand\bibname{References}
\renewcommand\listfigurename{Listing of figures}
\raggedright

\RequirePackage{pdfsync} %do pdf synchronization [andy]

\usepackage[closeFloats, noSeparatorLine]{fltpage} %use the custom modified fltpage package
\RequirePackage{afterpage} 





 


\synctex=1 % turn synctex on automatically to sync between pdf viewer [andy]

%   list an entire bibliography entry inline. Useful for acknowledging when my paper was previously published
\RequirePackage{bibentry} 
\nobibliography*        

\RequirePackage{lettrine} % big letter at start of chapter
\RequirePackage[width=5in, letterpaper]{geometry}

\RequirePackage{fancyhdr} 
\pagestyle{plain} % options: empty , plain , fancy
\RequirePackage[palatino]{quotchap}
\definecolor{chaptergrey}{rgb}{0.6,0,0}
\RequirePackage{titling}
\RequirePackage{setspace} 
\RequirePackage{colortbl}
\RequirePackage{booktabs} % for much better looking tables
\RequirePackage[labelfont={sf,bf,small},textfont={sf,small},justification=RaggedRight,margin=0pt, figurewithin=section, tablewithin=section]{caption}
\onehalfspacing
%\raggedright

\parindent 12pt
\RequirePackage{mathspec}


% use Arno Pro instead of standard LaTeX fonts
\setmathsfont(Digits,Latin,Greek){Arno Pro}
\setmathrm{Arno Pro}

\RequirePackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text}
\setromanfont[Mapping=tex-text, 
			  SizeFeatures={%
		          {Size={-10}, Font=* Caption},
		          {Size={10-13.0}, Font=*},
		          {Size={13.01-19.9}, Font=* Subhead},
		       {Size={19.91-},Font=* Display}}]
			  {Arno Pro} %
			
%Set fonts for Mac Specific (Comment out on Windows XP)
\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue} 
\setmonofont[Scale=MatchLowercase]{Consolas}

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}


\renewcommand{\maketitle}{ 
	\singlespacing
	\thispagestyle{empty}
	\vspace*{\fill} \vspace{100pt} \begin{center}
	\Huge \textcolor{Crimson}{\textit{\thetitle}} \normalsize \\  \vspace{100pt}
	a dissertation presented \\ by\\
	\theauthor\\ to\\ The \@department\\ Supervised By\\ \@advisor\\ 
	\vspace{12pt}
	in partial fulfillment of the requirements\\ 
	for the degree of\\ \@degree\\ 
	in the subject of\\ \@field\\
	\vspace{12pt}
	\@university\\ \@universitycity, \@universitystate\\ 
	\@degreemonth\ \@degreeyear
	\end{center} \vspace*{\fill}
}

% You might also consider licensing your work under Creative Commons). See: http://creativecommons.org/weblog/entry/12824 for other PhD students who have released their work under creative commons.

\newcommand{\copyrightpage}{
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\textsl{ \noindent \copyright~\textit{\@degreeyear \hspace{3pt}~- \theauthor}} \\
	\noindent All rights reserved.
	\vspace*{\fill} \newpage \rm
}

\newcommand{\abstractpage}{
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{3}
	\pagestyle{fancy}
	\lhead{\small Thesis Supervisor: \@advisor} \rhead{\small \@author}
	\renewcommand{\headrulewidth}{0.0pt} 
	\begin{center}
	\vspace*{14pt}
	\Large \textcolor{Crimson}{\textit{\@title}} \normalsize\\
	%\vspace*{5pt}
	 \large \textsl{Abstract} \\ \rm
	\end{center}
	\onehalfspacing %Harvard registrar requests that abstract is double spaced
	\input{frontmatter/abstract}
	\onehalfspacing %Harvard registrar requests that abstract is double spaced	
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
	\onehalfspacing
}

\newcommand{\dedicationpage}{
	\pagestyle{fancy}
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\textsl{ \noindent \input{frontmatter/dedication}}
	\vspace*{\fill} \newpage \rm
	}

% the list of authors
\newcommand{\authorlist}{
	\pagestyle{fancy}
	\newpage
	\thispagestyle{fancy} 
	\chapter*{Author List}
	\noindent \input{frontmatter/authorlist}
	\newpage \rm
	}

% the acknowledgments page
\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} 
	\newpage}
	
% An environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsl{#1}}

\usepackage{fullpage}

\titleformat{\subsubsection}
{\normalfont\normalsize\slshape}{\theparagraph}{1em}{}
\titlespacing*{\subsubsection}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\titleformat{\paragraph}
{\normalfont\normalsize}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\newcommand{\abbrlabel}[1]{\makebox[3cm][l]{\textbf{#1}\ \dotfill}}
\newenvironment{abbreviations}{\begin{list}{}{\renewcommand{\makelabel}{\abbrlabel}}}{\end{list}}


% for appendix
\NewDocumentCommand\headerspdf{ O {pages=-} m }{% [options for include pdf]{filename.pdf}
  \includepdf[%
    #1,
    pagecommand={\thispagestyle{fancy}},
    scale=.7,
    ]{#2}}
    
\NewDocumentCommand\secpdf{somO{1}m}{% [short title]{section title}[page specification]{filename.pdf} --- possibly starred
  \clearpage
  \thispagestyle{fancy}%
  \includepdf[%
    pages=#4,
    pagecommand={%
      \IfBooleanTF{#1}{%
        \section*{#3}}{%
        \IfNoValueTF{#2}{%
          \section{#3}}{%
          \section[#2]{#3}}}},
    scale=.65,
    ]%
    {#5}}

%listings setup
\definecolor{darkblue}{rgb}{0.0,0.0,0.6}
\definecolor{bggray}{rgb}{0.95,0.95,0.95}
\definecolor{darkred}{rgb}{0.5,0.1,0.1}

%colors for tables
\definecolor{table_header}{rgb}{0.69,0.76,0.86}
\definecolor{row_even}{rgb}{.95,.96,1}
\definecolor{row_odd}{rgb}{.98,.99,1}

 \lstdefinelanguage{XML}
{
  morestring=[b]",
  morestring=[s]{>}{<},
  morecomment=[s]{<?}{?>},
  stringstyle=\color{darkred}\ttfamily,
  identifierstyle=\color{darkblue},
  keywordstyle=\color{cyan},
  morekeywords={xmlns,version,type,start,stop,label,cvId,id}% list your attributes here
}
\lstset{
         basicstyle=\footnotesize\ttfamily, 
         numbers=left, 
         numberstyle=\tiny,
         stepnumber=1,
         numbersep=5pt,
         tabsize=2,
         extendedchars=true,
         breaklines=true, 
         keywordstyle=\color{red}\bfseries\emph,
         frame=btlr,
         stringstyle=\color{blue}\ttfamily, 
         showspaces=false,
         showtabs=false,  
         xleftmargin=10pt,
         framexleftmargin=17pt,
         framexrightmargin=5pt,
         framexbottommargin=4pt,
         backgroundcolor=\color{bggray},
         showstringspaces=false,
         language=XML
 }
