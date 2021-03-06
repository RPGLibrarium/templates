\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lbrprotocol}[2014/08/16 RPG Librarium protocol document]


%%%
% Derive from class: LbrGeneric
% http://texdoc.net/texmf-dist/doc/latex/memoir/memman.pdf
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lbrgeneric}}
\ProcessOptions\relax
% Default 
\PassOptionsToClass{11pt,a4paper,twoside,openany,article}{lbrgeneric}
\LoadClass{lbrgeneric}
%
%%%

%%%
\RequirePackage{lbrpagestyle}
\pagestyle{librarium}
%
%%%

% Do not indent new paragraphs in protocols. It looks strange.
\parindent0mm
\nonzeroparskip

%%%
% Configure Title
% Location variable
\makeatletter
\newcommand\ort[1]{\renewcommand\@ort{#1}}
\newcommand\@ort{\@latex@error{No \noexpand\ort given}\@ehc}

\newcommand\datum[1]{\renewcommand\@datum{#1}}
\newcommand\@datum{\@latex@error{No \noexpand\datum given}\@ehc}

% Participants variable
\newcommand\anwesende[1]{\renewcommand\@anwesende{#1}}
\newcommand\@anwesende{\@latex@error{No \noexpand\anwesende given}\@ehc}

% Sitzungsleitung variable
\newcommand\sitzungsleitung[1]{\renewcommand\@sitzungsleitung{#1}}
\newcommand\@sitzungsleitung{\@latex@error{No \noexpand\sitzungsleitung given}\@ehc}

% Protokollant variable
\newcommand\protokollant[1]{\renewcommand\@protokollant{#1}}
\newcommand\@protokollant{\@latex@error{No \noexpand\protokollant given}\@ehc}


\newcommand\vs[1]{
\renewcommand\@sitzungstype{Vorstandssitzung}
\renewcommand\@sitzungsnum{#1}}

\newcommand\mv[1]{
\renewcommand\@sitzungstype{Mitgliederversammlung}
\renewcommand\@sitzungsnum{#1}}

% Sitzungtype
\newcommand\@sitzungstype{\@latex@error{No \noexpand\sitzungstype given}\@ehc}
% MV Counter variable
\newcommand\@sitzungsnum{\@latex@error{No \noexpand\sitzungsnum given}\@ehc}


%%%
%Configure hyperref
\AtBeginDocument{
  \hypersetup{
    pdfauthor={\@protokollant},
    pdftitle={Protokoll der \@sitzungstype{} vom \@date},
    pdfsubject={},
    pdfkeywords={}
  }
}
\hypersetup{
  bookmarks=true,
  colorlinks=false,
  urlcolor=black,
  hyperindex=true
}
%
%%%


%Changes order of title elements
\renewcommand{\@maketitle}{%
   \null
   \vskip 2em%
   \vspace*{\droptitle}
   \maketitlehooka
   {\@bspretitle \@title \@bsposttitle}
   \maketitlehookb
   {\@bspredate \@date \@bspostdate}
   \maketitlehookc
   {\@bspreauthor \@author \@bspostauthor}
   \maketitlehookd
   \par
   \vskip 1.5em
}

\setlength{\droptitle}{0pt}

% Define content of title
\pretitle{\Large\bfseries}
          \title{Protokoll der \@sitzungstype{} \@sitzungsnum}
\posttitle{\par\vskip 0.5em}

\date{\@datum \\
\@ort}
\postdate{\end{center}\par\vskip 0.5em}

\preauthor{\noindent\vskip 1em \begin{tabular}{@{}lp{0.75 \textwidth}}}
\author{
  Protokollant: & \@protokollant \\
  Sitzungsleitung: & \@sitzungsleitung \\
  Anwesende: & \@anwesende \\
}
\postauthor{\end{tabular}}

% Set pagestyle for title page
\aliaspagestyle{title}{withfooter}

%%%


%%%
% Do not show chapters
\counterwithout{section}{chapter}
\setsecnumformat{TOP~\csname the#1\endcsname\quad}
%%%

%%%
% Beschlüsse und Wahlen
\sideparmargin{left}
\newcommand{\beschluss}[2]{\textbf{\sidepar{\textbf{B}}#1 (#2)}}
\newcommand{\wahl}[1]{\textbf{\sidepar{\textbf{W}}#1}}
%%%


%%%
% Anträge
\usepackage{xifthen}
\usepackage{xparse}
\NewDocumentCommand{\antrag}{+m +m +o}{%
  \subsection{#1}
  #2 %
  \IfValueT{#3}{\par\textbf{Begründung: }\textit{#3}}\par%
}
%%%

%%%
% Implement attachment list
\newenvironment{anlagen}{%
\vspace{2em}
\textbf{Anlagen: }
\tightlist
\begin{itemize}
}{%
\end{itemize}
\defaultlists
}
%%%

%%%
% Unterschrift linien
\newcommand{\unterschriftenMV}{
\vspace{2.5cm}

\begin{tabular}{p{.3\textwidth} p{.3\textwidth} p{.3\textwidth}}
Sitzungsleitung & Protokollführer & weiteres Mitglied
\end{tabular}
}

\newcommand{\unterschriftenVS}{
\vspace{2.5cm}

\begin{tabular}{p{.3\textwidth} p{.3\textwidth} p{.3\textwidth}}
Sitzungsleitung & Protokollführer
\end{tabular}
}
%%%
