/* COMPRESS=YES | CHAR */

data CharRepeats(compress=char);
   length RepeatingChar $ 200 FName $500 Lname $500;
   do i=1 to 100000;
      RepeatingChar='aaaaaaaaaaaaaaaaaaaaaa';
      FName='Carleigh';
      LName='Crabtree';
      output;
   end;
   drop i;
run;

/* COMPRESS=BINARY */

data survey_random(compress=binary);
   length customer_id 8;
   array q[200] Q1-Q200;

   do customer_id = 1 to 20000;
      do i = 1 to dim(q);
         /* Random Yes/No response */
         q[i] = ceil(ranuni(12345)*2); /* 1 or 2 */
      end;
      output;
   end;
   drop i;
run;

/* Binary Representation of 1 and 2 */
data test1;
	x=1;
	y=2;
	put x=;
	put x=binary64.;
	put y=;
	put y=binary64.;
run;
