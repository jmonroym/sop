\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unlsilabsop}[2014/06/27 v0.0 Modified article class for standard operating procedures in UNL SiLab]
% http://stackoverflow.com/questions/581916/how-do-you-extend-article-document-class-in-latex

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Modifications to the section titles
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\renewcommand{\thesection}{\Roman{section}}
\titleformat{\section}{\normalfont\bfseries}
  {\makebox[3em][l]{\thesection{}.}}{0pt}{}
  \titleformat{\subsection}{\normalfont\bfseries}
    {}{0pt}{}

    % Modification of title block
    \RequirePackage{titling}
    \RequirePackage{multirow}
    \newcommand{\approved}[1]{\newcommand{\theapproved}{#1}}
    \newcommand{\sopversion}[1]{\newcommand{\thesopversion}{#1}}
    % Ref: http://tex.stackexchange.com/questions/3988/titlesec-versus-titling-mangling-thetitle
    \let\oldtitle\title
    \renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
    \renewcommand{\maketitle}{%
	{\centering Standard Operating Procedure\par}
	\begin{tabular}{|c|p{2in}|l|l|} \hline
	    \multirow{3}{*}{\includegraphics[width=3cm]{unllogo.png}} & \multicolumn{1}{p{2.5in}|}{\centering UNL SiLab Pixel Phase-I upgrade} & Date: \thedate & Number: \\ \cline{2-4}
	& \multicolumn{1}{p{2.5in}|}{\centering Standard Operating Procedure } & \multicolumn{2}{p{2.5in}|}{Title: \mythetitle} \\ \cline{2-4}
	& Approved By: \theapproved & \multicolumn{2}{l|}{Revision \thesopversion Date: \quad / \quad / \quad} \\ \hline
	    \end{tabular}
    }

% For "Page N of M"
\RequirePackage{lastpage}
% For easier construction of page headers/footers
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{ % for first page
    \fancyhf{}
    \fancyfoot[L]{\framebox{Author: \theauthor}\\ \jobname{}.tex} 
    \fancyfoot[R]{\framebox{Page: \thepage{} of \pageref*{LastPage}}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{fancy} % for other pages
\fancyhf{}
\fancyhead[R]{%
    \begin{tabular}{|c|c|} \hline %
	Revision Date: & Number: \\
	\quad / \quad / \quad & \\ \hline
	\end{tabular}%
}
\fancyfoot[L]{\framebox{Author: \theauthor}}
\fancyfoot[R]{\framebox{Page: \thepage{} of \pageref*{LastPage}}} % \pageref* if we use hyperref, \pageref otherwise
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% For easier customization of itemized, enumerated, and other lists
\RequirePackage{enumitem}
% For hyperlinked cross-references
\RequirePackage{hyperref}
% Ensure first page is correct style
\thispagestyle{plain}
% That's all, folks!
\endinput