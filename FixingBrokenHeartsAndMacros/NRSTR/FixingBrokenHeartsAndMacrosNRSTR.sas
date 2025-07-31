/*******************************************/
/* Fixing Broken Hearts and Macros: %NRSTR */
/* Carleigh Jo Crabtree                    */
/*******************************************/

/*********************************/
/* Before running the blog code: */
/*********************************/

/* Create a library named blog for the superstore_small table. */
libname blog "pathToData";

/* Displays results of resolved macro variables in the log. */
options symbolgen;

/******************************/
/* A Happy Macro Relationship */
/******************************/

/* Works as expected. */
%let prodnm=Bush Somerset Collection Bookcase;

title "Orders placed for: &prodnm";
proc print data=blog.superstore_small;
	where product_name="&prodnm";
run;

/*****************************************************/
/* When Your Macro Seems Fine, but Isn't Fine at All */
/*****************************************************/

/* Works, but produces warnings in the log because of &Stick. */
%let prodnm=C-Line Peel&Stick Add-On Filing Pockets, 8-3/4 x 5-1/8, 10/Pack;

title "Orders placed for: &prodnm";
proc print data=blog.superstore_small;
	where product_name="&prodnm";
run;

/***********************************************/
/* There's Someone Else... in the Symbol Table */
/***********************************************/

/* Works but no report is generated. */ 
/* The value of &stick is resolved within the value of &prodnm. */
%let stick=UnwantedText;
%let prodnm=C-Line Peel&Stick Add-On Filing Pockets, 8-3/4 x 5-1/8, 10/Pack;

title "Orders placed for: &prodnm";
proc print data=blog.superstore_small;
	where product_name="&prodnm";
run;

/****************************************/
/* How to Save the Relationship: %NRSTR */
/****************************************/

/* %NRSTR masks the & so it is treated as text rather than a macro trigger. */
%let stick=UnwantedText;
%let prodnm=%nrstr(C-Line Peel&Stick Add-On Filing Pockets, 8-3/4 x 5-1/8, 10/Pack);

title "Orders placed for: &prodnm";
proc print data=blog.superstore_small;
	where product_name="&prodnm";
run;

/******************************************/
/* Additional (Macro) Relationship Advice */
/******************************************/

/* Quotations are pairwise characters. */
/* SAS will continue looking for the closing quotation mark resulting in problems. */
/* If the following is run, reset the SAS session. */
/* %let product=Eldon Fold 'N Roll Cart System; */

/* %STR with the % in front of the quotation mark masks the single quotation mark. */
%let prodnm= %str(Eldon Fold %'N Roll Cart System);
%put &=prodnm;

