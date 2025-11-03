/* Data steps*/
data test;
	set sashelp.airline; *reads the SAS Dataset Airlines;
run;

/* Create a new dataset called airline_create
--creates a new variable called Month
-- extracts the month number (1-12) from the variable date */

data airline_create;
	set sashelp.airline;
	Month = month(date);
run;

proc print data=airline_create;
run;

/* DATALINES: Internal Raw Data*/

data demographics_cols;
	input Name $ 1-5 Age 6-8 State $ 9-11 Weight 12-15;
	datalines;
Marie 25 WV 132
Adam 41 CA 210
Jen   26 MI 162
;
run;

/* Informats : reading raw data that are not in the right SAS format */

data data_sample;
	format Date_Birth MMDDYY10.; * make date of birth readable;
	inputt Name $ Date_Birth MMDDYY10.;
	Datalines;
Oliver 03-16-1972
Natale 12-11-1965
	;
run;

