%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%     AMASYA UNIVERSITESI
%     FEN BILIMLERI ENSTITUSU
%
%
%     TEZLER ICIN LATEX DOKUMAN SINIFI
%
%
%
%     Guncel Tez Yazim Kilavuzuna Gore Hazirlanmistir
%
%     Ihtiyac Halinde Duzenleme Yapilabilir
%
%
%
%     Hazirlayan: Suleyman OGREKCI
%     s.ogrekci@gmail.com
%
%
%
%     LISANS: CC-BY-NC-SA
%
%
%
%     30.06.2021
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Dokuman sinifi tanimi ve opsiyonlar
\NeedsTeXFormat{LaTeX2e}[2019/10/01]
\ProvidesClass{aufbetez}[2021/06/22 Suleyman Ogrekci]

\RequirePackage{etoolbox}
\newbool{phd}
\DeclareOption{doktora}{\booltrue{phd}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\ifbool{phd}
{
	\providecommand{\thesisname}{Doktora Tezi}
	\providecommand{\thesisnamecaps}{DOKTORA TEZİ}
	\providecommand{\thesisnameEN}{Ph. D. Thesis}
}
{
	\providecommand{\thesisname}{Yüksek Lisans Tezi}
	\providecommand{\thesisnamecaps}{YÜKSEK LİSANS TEZİ}
	\providecommand{\thesisnameEN}{M. Sc. Thesis}
}

\LoadClass[12pt, a4paper]{book}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Gerekli paketlerin tanimi
\RequirePackage{geometry} %sayfa geometrisi
\RequirePackage{mathptmx} %fontu times new roman yapar
\RequirePackage{setspace} %1.5 satir araligi ayarlamak icin
\RequirePackage[english, turkish]{babel} %dil destegi
\RequirePackage{parskip} %indentleri sifirlamak icin
\RequirePackage{longtable} %uzun tablolar icin
\RequirePackage{enumitem} %itemler icin
\RequirePackage{fancyhdr} %header-footer icin, sadece sayfa numaralari
\RequirePackage{titlesec} %titlelar icin
\RequirePackage{amsthm} %theorem-like environments icin
\RequirePackage{datetime}%time formatting icin
\RequirePackage{calc}%bazi hesaplamalar icin
\RequirePackage[titles]{tocloft}%icindekiler vs tablolari icin
\RequirePackage[figure, table, thesispic, thesismap]{totalcount}%fig, tab vs var mi yok mu
\RequirePackage{graphicx}%resim eklemek icin
\RequirePackage{multirow}%tablo hucre birlestirme icin
\RequirePackage{emptypage}%bos sayfalarin numaralarini silmek icin
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Tez govdesi icin gerekli ayarlamalar
\newdateformat{monthyeardate}{\monthname[\THEMONTH]-\THEYEAR}%tarih formati
\linespread{1.25}%1.5 satir araligi
\setlength{\parskip}{\baselineskip}%paragraflar arasi 1.5 satir bosluk
%\setlist[1]{noitemsep}%itemlar arasi ekstra bosluklarin iptali

\geometry{%Kenar bosluklari
	left=27.5mm,
	right=27.5mm,
	top=30mm,
	bottom=20mm,
	headsep=15mm,
%	showframe=true
}

\makeatletter%Dipnot yazi tipi boyutu 8pt
\renewcommand\footnotesize{%
	\@setfontsize\footnotesize\@ixpt{10}%
	\abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
	\abovedisplayshortskip \z@ \@plus\p@
	\belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
	\def\@listi{\leftmargin\leftmargini
		\topsep 4\p@ \@plus2\p@ \@minus2\p@
		\parsep 2\p@ \@plus\p@ \@minus\p@
		\itemsep \parsep}%
	\belowdisplayskip \abovedisplayskip
}
\makeatother

\pagestyle{fancy}%Alt ve ust bilgi
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
\fancyhead[LE]{}
\fancyhead[RO]{}
\fancyhead[RE]{}
\fancyhead[LO]{}
\fancyfoot[C]{}
\rhead{\fontsize{10}{12} \selectfont\thepage}
\fancypagestyle{plain}{%
	\fancyhf{}
	\rhead{\thepage}
}

%Bolum basliklari stili
\titleformat{\chapter}{\normalfont\fontsize{14}{16}\bfseries}{\thechapter.}{14pt}{}
\titlespacing*{\chapter}{0pt}{-30pt}{0pt}
\titleformat{\section}{\normalfont\fontsize{12}{14}\bfseries}{\thesection.}{12pt}{}
\titleformat{\subsection}{\normalfont\fontsize{12}{14}\bfseries}{\thesubsection.}{12pt}{}

%Teorem vb ortamlarin tanimlari
\swapnumbers %Numaralar basta olacak
\newtheoremstyle{thmstyle}%Yeni bir stil
{3pt}
{3pt}
{\normalfont}
{}
{\normalfont}
{}% Etiket sonrasinda noktalama olmamali
{.5em}
{}

\theoremstyle{thmstyle}%Bu stili kullananlar
\newtheorem{theorem}{Teorem}[chapter]
\newtheorem{lemma}[theorem]{Yardımcı Teorem}
\newtheorem{definition}{Tanım}[chapter]

\newtheoremstyle{rmkstyle}%Baska bir stil
{3pt}
{3pt}
{\normalfont}
{}
{\itshape}
{}
{.5em}
{}

\theoremstyle{rmkstyle}%Bu stili kullananlar
\newtheorem*{remark}{Uyarı}
\newtheorem*{example}{Örnek}
\newtheorem*{corollary}{Sonuç}

\makeatletter%Kanit ortaminda nokta kaldirilmali
\renewenvironment{proof}[1][\proofname]{\par
	\pushQED{\qed}%
	\normalfont \topsep6\p@\@plus6\p@\relax
	\trivlist
	\item[\hskip\labelsep
	\itshape
	%    #1\@addpunct{.}]\ignorespaces% DELETED
	#1]\ignorespaces% ADDED
}{%
	\popQED\endtrivlist\@endpefalse
}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Ozel sayfalarin tanimlari
\makeatletter%Sayfa temizleme icin gerekli bir makro
\newcommand{\checktoopen}{\if@openright\cleardoublepage\else\clearpage\fi}
\makeatother

%Gerekli bazi makrolar
\newcommand*{\yazar}[1]{\def\authorname{#1}}
\newcommand*{\tezbasligi}[1]{\def\title{#1}}
\newcommand*{\thesistitle}[1]{\def\titleEN{#1}}
\newcommand*{\tezteslimtarihi}[3]{\newdate{thesisdate}{#1}{#2}{#3}}
\newcommand*{\tezsavunmatarihi}[3]{\newdate{tecdate}{#1}{#2}{#3}}

\newcommand*{\enstitumuduru}[1]{\def\instchair{#1}}

\newcommand*{\anahtarkelimeler}[1]{\def\keywordsTR{#1}}
\newcommand*{\keywords}[1]{\def\keywordsEN{#1}}
\newcommand*{\sayfasayisi}[1]{\def\pagecount{#1}}
\newcommand*{\danisman}[1]{\def\supervisor{#1}}
\newcommand*{\danismanabd}[1]{\def\supervisoraffil{#1}}
\newcommand*{\danismanuni}[1]{\def\supervisorinst{#1}}

\def\secondsupervisor{}
\newcommand*{\ikincidanisman}[1]{\def\secondsupervisor{#1}}

\def\tecmembertwo{}
\def\tecmembertwoaffil{}
\def\tecmembertwoinst{}

\def\tecmemberthree{}
\def\tecmemberthreeaffil{}
\def\tecmemberthreeinst{}

\def\tecmemberfour{}
\def\tecmemberfouraffil{}
\def\tecmemberfourinst{}

\def\tecmemberfive{}
\def\tecmemberfiveinst{}
\def\tecmemberfiveaffil{}

\newcommand*{\juribaskani}[1]{\def\tecmemberchair{#1}}
\newcommand*{\juribaskaniabd}[1]{\def\tecmemberchairaffil{#1}}
\newcommand*{\juribaskaniuni}[1]{\def\tecmemberchairinst{#1}}

\newcommand*{\juriuyebir}[1]{\def\tecmemberone{#1}}
\newcommand*{\juriuyebirabd}[1]{\def\tecmemberoneaffil{#1}}
\newcommand*{\juriuyebiruni}[1]{\def\tecmemberoneinst{#1}}

\newcommand*{\juriuyeiki}[1]{\def\tecmembertwo{#1}}
\newcommand*{\juriuyeikiabd}[1]{\def\tecmembertwoaffil{#1}}
\newcommand*{\juriuyeikiuni}[1]{\def\tecmembertwoinst{#1}}

\newcommand*{\juriuyeuc}[1]{\def\tecmemberthree{#1}}
\newcommand*{\juriuyeucabd}[1]{\def\tecmemberthreeaffil{#1}}
\newcommand*{\juriuyeucuni}[1]{\def\tecmemberthreeinst{#1}}

\newcommand*{\juriuyedort}[1]{\def\tecmemberfour{#1}}
\newcommand*{\juriuyedortabd}[1]{\def\tecmemberfouraffil{#1}}
\newcommand*{\juriuyedortuni}[1]{\def\tecmemberfourinst{#1}}

\newcommand*{\juriuyebes}[1]{\def\tecmemberfive{#1}}
\newcommand*{\juriuyebesabd}[1]{\def\tecmemberfiveaffil{#1}}
\newcommand*{\juriuyebesuni}[1]{\def\tecmemberfiveinst{#1}}

\def\dedicationstatement{}
\newcommand*{\ithafcumlesi}[1]{\def\dedicationstatement{#1}}






%%%%% Ozet ortami tanimi
\newenvironment{ozet}{
	\checktoopen
	\thispagestyle{plain}
	\setcounter{page}{4}%sayfa numarasi 4 olacak
	\begin{center}
		{\normalsize \title\\(\thesisname) \par}
		{\normalsize \authorname \par}
		{\normalsize AMASYA ÜNİVERSİTESİ\\FEN BİLİMLERİ ENSTİTÜSÜ\\
			\monthyeardate\displaydate{thesisdate} \par}
		{\normalsize{ÖZET} \par}
	\end{center}
	\vskip -1\parskip
	\singlespacing%tek satir araligi
	\fontsize{11pt}{13pt}\selectfont%yazi tipi boyutu 11pt
}
{
	\vfill
\begin{description}[
	leftmargin=!,
	labelwidth=\widthof{\normalfont İkinci Danışman (varsa)}+1cm,
	font=\normalfont,
	nolistsep
	]
	\item[Sayfa Adedi]: \pagecount
	\item[Anahtar Kelimeler]: \keywordsTR
	\item[Danışman]: \supervisor
	\item[İkinci Danışman (varsa)]: \secondsupervisor
\end{description}
\addcontentsline{toc}{chapter}{ÖZET}
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Abstract (ingilizce ozet) ortami tanimi
\newenvironment{abstract}{
	\checktoopen
	\thispagestyle{plain}
	\begin{center}
		{\normalsize \titleEN\\(\thesisnameEN) \par}
		{\normalsize \authorname \par}
		{\normalsize AMASYA UNIVERSITY\\
			GRADUATE SCHOOL OF NATURAL AND APPLIED SCIENCES\\
			\selectlanguage{english}\monthyeardate\displaydate{thesisdate} \par}
		{\normalsize{ABSTRACT} \par}
	\end{center}
	\vskip -1\parskip
	\singlespacing%tek satir araligi
	\fontsize{11pt}{13pt}\selectfont%yazi tipi boyutu 11pt
}
{
	\vfill
	\begin{description}[
		leftmargin=!,
		labelwidth=\widthof{\normalfont İkinci Danışman (varsa)}+1cm,
		font=\normalfont,
		nolistsep
		]
		\item[Sayfa Adedi]: \pagecount
		\item[Anahtar Kelimeler]: \keywordsEN
		\item[Danışman]: \supervisor
		\item[İkinci Danışman (varsa)]: \secondsupervisor
	\end{description}
	\addcontentsline{toc}{chapter}{ABSTRACT}
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%% On soz sayfasi ortami
\newenvironment{onsoz}{
	\checktoopen
	\thispagestyle{plain}
	\addcontentsline{toc}{chapter}{ÖN SÖZ VE TEŞEKKÜR}
	\begin{center}
		{\normalsize\bfseries ÖN SÖZ VE TEŞEKKÜR \par}
	\end{center}
}
{
	\vfil\vfil\vfil\null
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Etik beyan sayfasi ortami
\newenvironment{etikbeyan}{
	\checktoopen
	\thispagestyle{empty}
	\vglue 4\baselineskip
	\begin{center}
		{\normalsize\bfseries ETİK BEYAN \par}
	\end{center}
}
{
	\begin{flushright}
		\vskip 1\baselineskip
		\authorname \\
		\getdateday{thesisdate}/\getdatemonth{thesisdate}/\getdateyear{thesisdate}
	\end{flushright}
	\vfil\vfil\vfil\null
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Ithaf sayfasi ortami
\newcommand{\ithafsayfasi}
{
	\ifdefempty{\dedicationstatement}
	{}
	{
		\checktoopen
		\thispagestyle{empty}
		\vglue 14\baselineskip
		\begin{flushright}
			\dedicationstatement
		\end{flushright}
		\vfil\vfil\vfil\null
	}
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Tez kabul ve onay sayfasi ortami
\newcommand{\tezkabulonaysayfasi}
{
	\checktoopen
	\thispagestyle{empty}
	\def\instchairstatement{Juri tarafından kabul edilen bu tezin \thesisname{} olması için gerekli şartları yerine getirdiğini onaylıyorum.}
	\def\memberstatement{Bu tezin, kapsam ve kalite olarak \thesisname{} olduğunu onaylıyorum/onaylamıyorum\hskip 1cm\dotfill}


	{\fontsize{11pt}{13pt}\selectfont\authorname{} tarafından hazırlanan ``\title{}'' adlı tez çalışması aşağıdaki jüri tarafından OY BİRLİĞİ/OY ÇOKLUĞU ile Amasya Üniversitesi Fen Bilimleri Enstitüsü Matematik Anabilim Dalında \thesisnamecaps{} olarak kabul edilmiştir. \par}


	\ifdefempty{\tecmemberfour}{\vskip 1\baselineskip}{}%7uye ise bir, 3 ve 5 uye ise iki bosluk

	%%%juri1: danisman
	{{\fontsize{11pt}{13pt}\selectfont\bfseries Danışman:}
		\supervisor\\ \supervisoraffil{} Anabilim Dalı, \supervisorinst\\
		\fontsize{9pt}{11pt}\selectfont\memberstatement}

	\ifdefempty{\tecmembertwo}{\vskip 1\baselineskip}{}%3uye ve 5uye icin farkli bosluk


	%%juri2: baskan
	{{\fontsize{11pt}{13pt}\selectfont\bfseries Başkan:}
		\tecmemberchair\\ \tecmemberchairaffil{} Anabilim Dalı, \tecmemberchairinst\\
		\fontsize{9pt}{11pt}\selectfont\memberstatement}

	\ifdefempty{\tecmembertwo}{\vskip 1\baselineskip}{}%3uye ve 5uye icin farkli bosluk

	%%juri3: uye1
	{{\fontsize{11pt}{13pt}\selectfont\bfseries Üye:}
		\tecmemberone\\ \tecmemberoneaffil{} Anabilim Dalı, \tecmemberoneinst\\
		\fontsize{9pt}{11pt}\selectfont\memberstatement}

	\ifdefempty{\tecmembertwo}{\vskip 1\baselineskip}{}%3uye ve 5uye icin farkli bosluk


	%%juri4: uye 2, varsa. sadece 5 veya 7 uyeli juride vardır
	\ifdefempty{\tecmembertwo}
	{}
	{
		{{\fontsize{11pt}{13pt}\selectfont\bfseries Üye:}
			\tecmembertwo\\ \tecmembertwoaffil{} Anabilim Dalı, \tecmembertwoinst\\
			\fontsize{9pt}{11pt}\selectfont\memberstatement}
	}

	\ifdefempty{\tecmembertwo}{\vskip 1\baselineskip}{}%3uye ve 5uye icin farkli bosluk


	%%juri5: uye 3, varsa. sadece 5 veya 7 uyeli juride vardır
	\ifdefempty{\tecmemberthree}
	{}
	{
	{{\fontsize{11pt}{13pt}\selectfont\bfseries Üye:}
		\tecmemberthree\\ \tecmemberthreeaffil{} Anabilim Dalı, \tecmemberthreeinst\\
		\fontsize{9pt}{11pt}\selectfont\memberstatement}
	}


	%%juri6: uye 4, varsa. sadece 7 uyeli juride vardır
	\ifdefempty{\tecmemberfour}
	{}
	{
		{{\fontsize{11pt}{13pt}\selectfont\bfseries Üye:}
			\tecmemberfour\\ \tecmemberfouraffil{} Anabilim Dalı, \tecmemberfourinst\\
			\fontsize{9pt}{11pt}\selectfont\memberstatement}
	}


	%%juri7: uye 5, varsa. sadece 7 uyeli juride vardır
	\ifdefempty{\tecmemberfive}
	{}
	{
		{{\fontsize{11pt}{13pt}\selectfont\bfseries Üye:}
			\tecmemberfive\\ \tecmemberfiveaffil{} Anabilim Dalı, \tecmemberfiveinst\\
			\fontsize{9pt}{11pt}\selectfont\memberstatement}
	}


	%3uye için 4, 5uye icin 2, 7uye icin 1 bosluk
	\ifdefempty{\tecmembertwo}
	{\vskip 3\baselineskip}
	{
		\ifdefempty{\tecmemberfour}{\vskip 1\baselineskip}{}
	}
%%%uyeler bitti.


	{
		\fontsize{11pt}{13pt}\selectfont Tez Savunma Tarihi:
		\getdateday{tecdate}/\getdatemonth{tecdate}/\getdateyear{tecdate}
		\ifdefempty{\tecmemberfour}{\par}{\\}%tez basligi uzunsa
	}
	{\normalfont\instchairstatement}


	%3uye için 8, 5uye icin 3, 7uye icin 2 bosluk
	\ifdefempty{\tecmembertwo}
	{\vskip 7\baselineskip}
	{
		\ifdefempty{\tecmemberfour}{\vskip 2\baselineskip}{\vskip 1\baselineskip}
	}

	\begin{center}
		{\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots}\\
		{\fontsize{11pt}{13pt}\selectfont \instchair}\\
		{\fontsize{11pt}{13pt}\selectfont Fen Bilimleri Enstitüsü Müdürü}
	\end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Ic kapak sayfasi ortami
\newdateformat{uppermonthdate}{\monthname[\THEMONTH] \THEYEAR}%kapak tarihi

\makeatletter%Ay bilgisi kapakta buyuk harf olmali
\newcommand*{\mymonthnameturkish}[1][\month]{%
	\@orgargctr=#1\relax
	\ifcase\@orgargctr
	\PackageError{datetime}%
	{Invalid Month number \the\@orgargctr}%
	{Month numbers should go from 1 (JANUAR) to 12 (DECEMBER)}%
	\or OCAK \or ŞUBAT \or MART \or NİSAN \or MAYIS \or HAZİRAN \or TEMMUZ %
	\or AĞUSTOS \or EYLÜL \or EKİM \or KASIM \or ARALIK %
	\else
	\PackageError{datetime}%
	{Invalid Month number \the\@orgargctr}%
	{Month numbers should go from 1 (JANUAR) to 12 (DECEMBER)}%
	\fi
}%


\newcommand{\ickapak}
{
	\let\oldmonthnameturkish\monthnameturkish
	\renewcommand{\monthnameturkish}{\mymonthnameturkish}
	
	\thispagestyle{empty}
	
	\begin{center}
		\vglue 2cm
		\fontsize{13pt}{15pt}\selectfont\bfseries
		{\title \par}
		\vfil
		{\authorname \par}
		\vfil
		{\thesisnamecaps \par}
		\vfil
		{Danışman \par \supervisor\par}
		\ifdefempty{\secondsupervisor}{}{{İkinci Danışman \par \secondsupervisor\par}}
		\vfil
		{AMASYA ÜNİVERSİTESİ \par}
		{FEN BİLİMLERİ ENSTİTÜSÜ \par}
		\vfil
		{\uppermonthdate\displaydate{thesisdate} \par}
	\end{center}
	\renewcommand{\monthnameturkish}{\oldmonthnameturkish}		
}
%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%% Icındekiler vb dizinler icin ayarlamalar

\makeatletter%tablo,cizelge vs listelerinde bolumler arasi bosluklar silinmeli
\def\@gobblesix#1#2#3#4#5#6{}
\patchcmd{\@chapter}
{\chaptermark{#1}}
{\chaptermark{#1}\@gobblesix}
{}{}
\makeatother

%Icındekiler listesi formati
\renewcommand\cftchapaftersnum{.}% TOCda chapter numarasi sonrasinda nokta olacak
\renewcommand\cftsecaftersnum{.}%section sonrasi da ayni
\renewcommand\cftsubsecaftersnum{.}%subsection sonrasi da ayni
\renewcommand\cfttabaftersnum{.}%cizelge (tablo) sonrasi da ayni
\renewcommand\cftfigaftersnum{.}%sekil (figure) sonrasi da ayni
\renewcommand{\cftdot}{\normalfont .}%noktalar bold olmasin
\renewcommand\cftchapdotsep{\cftdotsep}%chapterler noktali olacak sona kadar
\renewcommand\cftchapfont{\normalfont}%chapter basliklari bold olmasin
\renewcommand{\cftchappagefont}{\normalfont}%chapter sayfa numarasi normal font olmali

\renewcommand\turkishtablename{Çizelge}%caption icinde tablo -> cizelge
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Cizelgeler dizini ortami
\newcommand{\cizelgelerdizini}{
	\renewcommand{\listtablename}{\begin{center}\normalsize ÇİZELGELER DİZİNİ\end{center}
		\vglue 0\baselineskip \normalsize Çizelge\hfill \normalsize Sayfa \vglue -1\baselineskip}%Buyuk harf baslik
	\renewcommand{\cftlottitlefont}{\normalsize\bfseries}%Bold yazi tipi
	\setlength{\cfttabindent}{0pt} %Sola hizalama
	\renewcommand{\cfttabpresnum}{Çizelge }%Etiket
	\addtolength{\cfttabnumwidth}{2.75em}%Etiket sonrasi bosluk
	
	\iftotaltables%Tablo yoksa yazma
	\listoftables
	\addcontentsline{toc}{chapter}{ÇİZELGELER DİZİNİ}
	\fi	
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Sekiller dizini ortami
\newcommand{\sekillerdizini}{
	\renewcommand{\listfigurename}{\begin{center}\normalsize ŞEKİLLER DİZİNİ\end{center}
		\vglue 0\baselineskip \normalsize Şekil\hfill \normalsize Sayfa \vglue -1\baselineskip}%Buyuk harf baslik
	\renewcommand{\cftloftitlefont}{\normalsize\bfseries}%Bold yazi tipi
	\setlength{\cftfigindent}{0pt}%Sola hizalama
	\renewcommand{\cftfigpresnum}{Şekil }%Etiket
	\addtolength{\cftfignumwidth}{1.75em}%Etiket sonrasi bosluk

	\iftotalfigures%Sekil yoksa yazma
	\listoffigures
	\addcontentsline{toc}{chapter}{ŞEKİLLER DİZİNİ}
	\fi	
}
%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%% Resimler dizini ayar ve tanimlari
\newcommand{\listofthesispicname}{\begin{center}\normalsize RESİMLER DİZİNİ\end{center}
	\vglue 0\baselineskip \normalsize Resim\hfill \normalsize Sayfa \vglue -1\baselineskip}

\newlistof[chapter]{thesispic}{lotp}{\listofthesispicname}
\renewcommand\cftthesispicaftersnum{.}%numaradan sonra nokta olsun


\newenvironment{thesispicture}[1]{%
	\par%
	\addvspace{\baselineskip}%
	\refstepcounter{thesispic}%
	\def\thesispiccap{#1}
	\addcontentsline{lotp}{thesispic}{\protect\numberline{\thethesispic}#1}%
	\addvspace{0.5\baselineskip}%
	% \\%
}{%
	\par%
	{\centering {Resim \thethesispic: \thesispiccap}\par}
	\addvspace{0.5\baselineskip}%
}%


\newcommand{\resimlerlerdizini}{
	\renewcommand{\cftlotptitlefont}{\normalsize\bfseries}%Bold yazi tipi
	\setlength{\cftthesispicindent}{0pt}%Sola hizalama
	\renewcommand{\cftthesispicpresnum}{Resim }%Etiket
	\addtolength{\cftthesispicnumwidth}{3.0em}%Etiket sonrasi bosluk
		
	\iftotalthesispics%Resim yoksa yazma
	\listofthesispic
	\addcontentsline{toc}{chapter}{RESİMLER DİZİNİ}
	\fi	
}
%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%% Haritalar dizini ayarlama ve tanimlari
\newcommand{\listofthesismapname}{\begin{center}\normalsize HARİTALAR DİZİNİ\end{center}
	\vglue 0\baselineskip \normalsize Harita\hfill \normalsize Sayfa \vglue -1\baselineskip}

\newlistof[chapter]{thesismap}{lotm}{\listofthesismapname}
\renewcommand\cftthesismapaftersnum{.}%numaradan sonra nokta olsun


\newenvironment{thesismap}[1]{%
	\par%
	\addvspace{\baselineskip}%
	\refstepcounter{thesismap}%
	\def\thesismapcap{#1}
	\addcontentsline{lotm}{thesismap}{\protect\numberline{\thethesismap}#1}%
	\addvspace{0.5\baselineskip}%
	% \\%
}{%
	\par%
	{\centering {Harita \thethesismap: \thesismapcap}\par}
	\addvspace{0.5\baselineskip}%
}%


\newcommand{\haritalardizini}{
	\renewcommand{\cftlotmtitlefont}{\normalsize\bfseries}%Bold yazi tipi
	\setlength{\cftthesismapindent}{0pt}%Sola hizalama
	\renewcommand{\cftthesismappresnum}{Harita }%Etiket
	\addtolength{\cftthesismapnumwidth}{3.0em}%Etiket sonrasi bosluk
	
	
	\iftotalthesismaps%Harita yoksa yazma
	\listofthesismap
	\addcontentsline{toc}{chapter}{HARİTALAR DİZİNİ}
	\fi	
}
%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%% Icındekiler listesi ayarlari
\newcommand{\icindekiler}{
	\renewcommand{\contentsname}{\begin{center}\normalsize İÇİNDEKİLER\end{center} \hfill
		\normalsize Sayfa \vglue -2\baselineskip} %Baslik tanimi
	
	\tableofcontents
	\addcontentsline{toc}{chapter}{İÇİNDEKİLER}
}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Simgeler ve kisaltmalar dizini ortami tanimi
\newenvironment{simgelerdizini}
{
	\checktoopen
	\begin{center}
		\bfseries\normalsize SİMGELER ve KISALTMALAR DİZİNİ
		\vskip 1\baselineskip
	\end{center}
	{\par \normalfont Bu çalışmada kullanılmış bazı simgeler ve kısaltmalar, açıklamaları ile birlikte aşağıda sunulmuştur.}
	\addcontentsline{toc}{chapter}{SİMGELER VE KISALTMALAR DİZİNİ}
}
{}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Ozgecmis ortami tanimi
\newenvironment{ozgecmis}
{
	\checktoopen
	\begin{center}
		\bfseries ÖZGEÇMİŞ
		\vskip 1\baselineskip
	\end{center}
	\addcontentsline{toc}{chapter}{ÖZGEÇMİŞ}
}
{}
%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Ekler icin kapak tanimi
\newcommand{\eklerkapagi}
{
	\checktoopen
	\vglue 12\baselineskip
	\begin{center}
		\fontsize{28pt}{30pt}\selectfont\bfseries EKLER
	\end{center}
	\addcontentsline{toc}{chapter}{EKLER}
	\vfil\vfil\vfil\null
	\checktoopen
}
%%%%%%%%%%%%%%%%%%%%%%%%%














