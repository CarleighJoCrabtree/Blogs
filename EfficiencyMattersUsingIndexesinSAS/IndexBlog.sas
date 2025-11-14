libname effi "C:/IndexBlog/data";
libname out "C:/IndexBlog/output";

/* Sorting Data */

proc sort data=effi.orders_new out=out.orders_sort;
	by Continent Country State_Province Customer_Group Customer_Type Customer_ID Order_ID;
run;

/* Creating Indexes in the DATA Step */

options msglevel=i;
	
data us_orders (index=(State_Province CustOrd=(Customer_ID Order_ID)));
	set out.orders_sort;	
	where Country="United States";
run;

/* Creating Indexes with PROC SQL */

data sql_ex;
	set out.orders_sort;
run;

proc sql;
create index State_Province
	on sql_ex(State_Province);
create index CustOrd
	on sql_ex(Customer_ID, Order_ID);
quit;

/* Creating Indexes with PROC DATASETS */

data datasets_ex;
	set out.orders_sort;
run;

proc datasets library=work nolist;
	modify datasets_ex;
	index create State_Province;
	index create CustOrd=(Customer_ID Order_ID);
quit;

/* Example 1 */

data ex_1;
	set effi.orders_new;
	where Customer_ID=10860;
run; 

options msglevel=i;
data ex_1;
	set datasets_ex;
	where Customer_ID=10860;
run;	

/* Example 2 */

data employee_master(index=(EmployeeID));
	set effi.employee_master (rename=(Employee_ID=EmployeeID));
run;

options msglevel=i;

proc sql;
select m.employeeID, m.employee_name, phoneType, phoneNumber
	from employee_master as m 
	inner join effi.employeephones as p
	on m.employeeID= p.employeeID
	where m.EmployeeID=120178;
quit;

/* Example 3 */

data orders_not_sorted(index=(State_Province));
	set effi.orders_new;
run;
	
proc means data=orders_not_sorted mean;
	var quantity;
	by State_Province;	
run;
	
proc means data=datasets_ex mean;
	var quantity;
	by State_Province;	
run;