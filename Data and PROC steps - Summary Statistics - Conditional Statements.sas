/* To create a library called mysets */
libname mysets '/home/u64377655/sasuser.v94/Sample_Sets/mysets1'; * from external data;
run;

data mysets.bweight_kg;
	set sashelp.bweight; *name of old dataset;
	Weight_kg = WEight/1000; *division;
run;


data mysets.bweight_kg;
	set sashelp.bweight;
	Weight_kg = WEight/1000; *division;
	Domestic_Status = "International"; *character assignment;
run;


/* SUMMARY STATISTICS */

/* PROC MEANS*/

/* Example (E.g.) 1*/

proc means data=sashelp.baseball;
	var nHits nRuns;
run;

/* E.g. 2 */

proc means data=sashelp.baseball median q1
	maxdec=2 nmiss n mean;  *maxdec is round to 2 decimal places;
	var nHits nRuns;
	output out = baseball_stats;   * save output;
run;

/* E.g. 3 -  CLASS */

/* Summary statistics - categrorical variable that has different level*/
proc means data=sashelp.baseball;
	class League;   
	var nHits nRuns;
run;

/* E.g. 4 - SORT BY */

/* similar to class except data must be sorted first*/

proc sort data=sashelp.baseball out=baseball_sort;
	by League;;
run;

proc means data=baseball_sort;
	by League;
	var nHits nRuns;
run;

/* E.g. 5 */

/* WHERE Statement - can be used justa as in a DATA Step*/
/* Title added*/

proc means data=sashelp.baseball;
	var nOuts;
	where team not ='Houston';
	Title 'Summary of Outs for All Teams Except Houston';
run;



/* PROC FREQ - Looking at frequencies preferably among categorical variables*/

/* E.g. 6 */ 

/*ONE-WAY Frequency (No Options)*/

proc freq data=sashelp.baseball;
	tables Position;
run;

/* E.g. 7 */

/*two One-Way frquency (one frequency table for position and another for league)*/

proc freq data=sashelp.baseball;
	tables Position League;
run;

/* E.g. 8 */

/*ONE-WAY Frequency (Options)*/

proc freq data=sashelp.baseball;
	tables Position/NOCUM; *NOCUM can only be used for one-way frequency;
run;

/* E.g. 9 */

/*Two-Way Frequency (No Options) - Crosstabulation */

proc freq data=sashelp.baseball;
	table Division*League;
run;

/* E.g. 10 */

/*Two-Way Frequency (Options) - Crosstabulation */

proc freq data=sashelp.baseball;
	table Division*League/NOROW;
run;


/* CONDITIONAL STATEMENTS*/

/* E.g. 11 */

/* 'IF/THEN' - (Using Conditions To Create New Variables)*/

data class_new;
	length NewSex $10;  * maximum length for the new variable 'NewSex';
	set sashelp.class;
	if Sex = 'M' then NewSex = 'Male';
run;

/* E.g. 12 */

/* 'IF/THEN/ELSE' (when you want to look at TWO conditions)*/

data class_new;
	length NewSex $10;  * maximum length for the new variable 'NewSex';
	set sashelp.class;
	if Sex = 'M' then NewSex = 'Male';
	else NewSex = 'Female';
run;

/* E.g. 13 */

/* 'IF/THEN/ELSE IF/ELSE' (looking at THREE or MORE conditions)*/

data fish_new;
	length Fish_Size $10;
	set sashelp.fish;
	if Length1 < 15 then Fish_Size = "Small";
	else if Length1 > 15 and Length1 < 25 then Fish_Size = "Medium";
	else Fish_Size = "Large";
run;

/* E.g. 14 */

/* 'IF/THEN DO/END' (when you want to perform MORE THAN 1 action to a condition)*/

data fish_new2;
	length Fish_Location $12;
	length Fish_Size $12;
	set sashelp.fish;
	if Length1 < 15 Then Do;
	Fish_Size = 'Small';
	Fish_Location = 'SaltWater';
	end;
	if Length1 >15 and Length1 < 25 THEN DO;
	Fish_Size = 'Medium';
	Fish_Location = 'Freshwater';
	end;
	if Length1 >=25 THEN DO;
	Fish_Size = 'Large';
	Fish_Location = 'Freshwater';
	end;
run;


/* DO LOOPS & DO UNTIL */

/* E.g. 15 */

/* DO */
/* final bonus rate value (only one output - the last observation) */

data bonus_rates;
	bonus_rate = 0.01;
		do i = 1 to 6;
		bonus_rate + 0.01;
		end;
run;

/* E.g. 16 */

/* List of Bonus Rates (outputs all of the iteration)*/

data bonus_rates_list;
  bonus_rate = 0.01;
  do i = 0.01 to 0.20 by 0.01;
    bonus_rate = bonus_rate + 0.01;
    output;    * outputs each iteration
  end;
run;

/* E.g. 17 */

/* Do Until */

data mortgage;
mortgage = 100000;
payments = 0;   * counter;
do until (mortgage = 0);
   mortgage = mortgage - 1000;
   payments = payments + 1;
  output; * outputs each payment and the corresponding counter; 
  end;  
run; 

/* E.g. 18 */

/* 'DO UNTIL LOOP' - DO combined with 'DO UNTTIL' (Nested DO loop )*/

Data Bonus_Rates;
	Do Bonus_Rate = 0.01 to 0.1 by 0.01;
	Min_Salary = 40000;
	count = 1;
	
	Do until (Bonus_Rate <= 0.1);
	Salary_Bonus = (Bonus_Rate * Min_Salary) + Min_Salary;
	count = count + 1;
	end;         * closes the 'DO UNTIL';
	output;      * Outputs after BOTH DO LOOPS are Executed;
	end;         * closes the iterative 'DO', the firdt 'DO';
run;



	
