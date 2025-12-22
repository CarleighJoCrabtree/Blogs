/* %NRSTR masks special characters so &Stick is not resolved at compilation */

%let stick=UnwantedText;
%let prodnm=%nrstr(C-Line Peel&Stick Add-On Filing Pockets, 8-3/4 x 5-1/8, 10/Pack);

%put &=prodnm;

/* Log: */
/* PRODNM=C-Line Peel&Stick Add-On Filing Pockets, 8-3/4 x 5-1/8, 10/Pack */

/* When %UPCASE is used, the returned result of &prodnm is unmasked and undesired results are produced */
%let stick=UnwantedText;
%let prodnm=%nrstr(C-Line Peel&Stick Add-On Filing Pockets, 8-3/4 x 5-1/8, 10/Pack);
%let uProd=%upcase(&prodnm);

%put &=uProd;

/* Log: */
/* UPROD=C-LINE PEELUnwantedText ADD-ON FILING POCKETS, 8-3/4 X 5-1/8, 10/PACK */

/* Macro Q functions mask returned results */
/* When %QUPCASE is used, the returned result of &prodnm is masked so the word scanner does not interpret the ampersand as a macro trigger */
%let stick=UnwantedText;
%let prodnm=%nrstr(C-Line Peel&Stick Add-On Filing Pockets, 8-3/4 x 5-1/8, 10/Pack);
%let quprod=%qupcase(&prodnm);

%put &=quprod;

/* Log: */
/* QUPROD=C-LINE PEEL&STICK ADD-ON FILING POCKETS, 8-3/4 X 5-1/8, 10/PACK */