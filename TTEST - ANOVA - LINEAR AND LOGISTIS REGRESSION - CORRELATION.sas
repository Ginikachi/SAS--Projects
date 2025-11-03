/* PEARSON CORRELATION COEFFICIENT*/

/* E.g. 1 */
/* Running a PROC CONTENTS to look at my data */

proc contents data=sashelp.baseball;
run;

proc corr data=sashelp.baseball;
	var CrHits;     * x variable;
	with CrRuns;    * y variable;
run;

/* E.g. 2 - Proc corr without a var and with statement */
/* multi -correlation - between more than one variable */

proc corr data=sashelp.baseball;
run;

/* e.g 3 - GRAPHS using PROC CORR*/

proc corr data= sashelp.baseball	
	plots = (scatter);
	var CrHits nBB;
	with CrRuns;
run;

/*e.g. 4 */

/* ONE WAY ANOVA */
/* Analysis of Variance of THREE OR MORE Group MEANS based on ONE other factor (the one factor is a numeric variable) */

/* Does a mother's education level (0, 1, 2, 3) impact the number of prenatal visits */
/* null hypo: no difference between group means. */
/* Alternative: there is a difference between at least two of the group means */

proc contents data=sashelp.bweight;   * just to look at he content of the data
run;

proc anova data=sashelp.bweight;
class MomEdLevel;             *categorical variable -variable witth 4 groups of education level;
model Visit = MomEdLevel;     *the one factor is visit;
run;

/* e.g. 5 - TUKEY TEST */

/* what groups have different means */

proc anova data=sashelp.bweight;
class MomEdLevel;             *categorical variable -variable witth 4 groups of education level;
model Visit = MomEdLevel;     *the one factor is visit;
means MomEdLevel/tukey;
run;


/* e.g. 6 */

/* SIMPLE LINEAR REGRESSION */

/* Goal : minimise the sum  of square residuals */

/* question: what is the trend (relationship) between the citty MPG and the highway MPG using the asahelp.car dataset? */

proc reg data= sashelp.cars;
model MPG_City = MPG_Highway;
run;
quit;


/* e.g. 7 */

/* ASSUMPTIONS CHECK BEFORE I MODEL */

/* assumption 1: linear Relationship between X and Y */
/* assumption2: if there is MULTICOLLINEARITY between the Xs */

/*Problem: Are my nummberic predicitor variables (Number of Stores, Inventory, Returns) linearly correlated witth my target(Sales) */

proc corr data=sashelp.shoes plots= (SCATTER MATRIX);
	with Sales;   * your target or y variable;
run;

* Pearson R correlation coefficient > 0.7 (vary);


/*Problem: check for multicollinearity -  you don't want predictors that have multicollinearity between each others*/

*Looking for Xs with strong multicollin;

proc corr data=sashelp.shoes;
run;

/* VIF - another way to measyre multicollinearity */
/* >10 indicates high multicollinearity */

proc reg data=sashelp.shoes;
	model Sales=Inventory Returns Stores / vif;
run;


/* e.g. 8 */

/* LOGISITIC REGRESSION */ 

/* TITANIC DATA SET USED*/

/* models the log odds of y; it's a logit function (unlike a direct linear relationship for simple linear regression) */
/* Categorical target
/* What is this observation's probability that it will have the event */

/* Look at the variable names and size of the data set */

proc contentts data=titanic;
run;

/* Check for some assumptions */

proc corr data=titanic;    * if there is any x variables that are highly correlated only use one;
run;

/*Logisitci Regression Needsa a Binary Response Var
let's look at that variable*/

proc freq data=titanic;
table Survived;
run;
quit;


/*Logisitic Model */

proc logistic data=titanic;
class Embarked Sex;    *categorical variables;
model Survived(event='1') = Age Embarked Sex;
run;


/* e.g. 9 */

/* TWO-WAY ANOVA (TWO CATEGORICAL PREDICTORS) */

/* Tests the effect of Two categorical factors (x variables) on a continuous response (Y) variable
as well as the interactions between those two factors */ 

data scores;
    input studied $ class $ score;
    datalines;
Y Fre 86
Y Fre 85
Y Fre 88
Y Fre 99
Y Fre 69
N Fre 72
N Fre 88
N Fre 76
N Fre 55
N Fre 59
Y Sop 99
Y Sop 70
Y Sop 65
Y Sop 91
Y Sop 86
N Sop 74
N Sop 77
N Sop 57
N Sop 74
N Sop 77
;
run; 

proc Anova data=scores;
class studied class;
model score = studied class studied*class;
means studied class / tukey cldiff;
run;


/* e.g. 10 */

/* T-TEST */

/* Compares the means of two groups
-- Null: the true difference between these group means is zero.
-- Alternative: the true difference is different from zero */

/* -- One Sample t-test: is there a difference between a group and the population
-- Two Sample (Unpaired) t-test: is there a difference between two groups
-- Paired samples t-test: Is there a difference in a group between two points in time */

data bodyfat; 
 input Group $ bodyfatpct @@; 
 datalines; 
Male 16.2 Male 17.4
Female 22.3 Female 21.2
Female 27.8 Female 18.3
Male 19.2 Male 14.2
Male 20.2 Male 16.5
Female 19.8 Female 22.6
Male 17.2 Male 13.2
Female 20.1 Female 18.9 
Female 21.3 Female 22.7 
Female 26.8 Female 20.9 
Male 16.7 Male 15.8 
Male 14.8 Male 22.9 
Male 18.8 Male 21.7
Male 17.7 Male 18.9 
Female 23.2 Female 24.7 
Female 26.8 Female 23.4
;
run; 

proc ttest data=bodyfat;
	class Group;
	var bodyfatpct;
run;

proc ttest data=sashelp.baseball;
	class League;
	var CrHome;
run;
