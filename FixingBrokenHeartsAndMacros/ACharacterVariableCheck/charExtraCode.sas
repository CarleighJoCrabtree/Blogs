/* View what dsid looks like- it will be a unique numeric data set identifier if data set is successfully opened, 0 if data set could not be opened */
%let dsid = %sysfunc(open(sashelp.company,i));
%put &=dsid;

/* Vies the number of variables in the data set */
%let nvars = %sysfunc(attrn(&dsid,nvars));
%put &=nvars;

/* View what rc looks like- the values will be 0 if the data set was closed successfully, nonzero if there was an error */
%let rc = %sysfunc(close(&dsid));
%put &=rc;

/* Compare the column lengths */
proc contents data=company_new;
run;
proc contents data=sashelp.company;
run;