This repository contains a collection of SAS programs demonstrating practical skills in data manipulation, exploratory data analysis, inferential statistics, and predictive modeling. These examples cover core SAS procedures used in analytics, biostatistics, and data science, showcasing both foundational and intermediate SAS programming abilities.

The scripts include examples using built-in SAS datasets as well as manually created data, demonstrating strong understanding of DATA steps, PROC steps, control flow, loops, and statistical procedures.

📂 Contents

1. Statistical Analysis & Modeling (T-Tests, ANOVA, Regression, Correlation)

File: TTEST - ANOVA - LINEAR AND LOGISTIC REGRESSION - CORRELATION.sas
Includes demonstrations of:

✅ Pearson correlation

✅ Scatterplots and correlation graphs

✅ One-way ANOVA

✅ Two-way ANOVA

✅ Tukey post-hoc test

✅ Simple linear regression

✅ Assumptions checking (multicollinearity, VIF)

✅ Logistic regression (binary outcome modeling using PROC LOGISTIC)

✅ PROC CONTENTS, PROC CORR, PROC REG, PROC ANOVA, PROC LOGISTIC

Example excerpt:
proc reg data=sashelp.cars;
    model MPG_City = MPG_Highway;
run;

proc logistic data=titanic;
    class Embarked Sex;
    model Survived(event='1') = Age Embarked Sex;
run;

2. DATA Steps, Summary Statistics & Conditional Logic

File: DATA and PROC steps - Summary Statistics - Conditional Statements.sas
Covers essential SAS programming techniques:

✅ Creating libraries and new datasets

✅ Creating new variables

✅ Summary statistics using PROC MEANS (with CLASS, BY, WHERE)

✅ Frequency tables (PROC FREQ)

✅ Conditional logic: IF–THEN, IF–ELSE, ELSE IF

✅ DO loops

✅ DO UNTIL loops

✅ Nested DO loops

Example excerpt:

data class_new;
    length NewSex $10;
    set sashelp.class;
    if Sex = 'M' then NewSex = 'Male';
    else NewSex = 'Female';
run;

proc means data=sashelp.baseball median q1 maxdec=2 mean;
    var nHits nRuns;
run;

3. Data Creation, Import and Raw Data Handling

File: Data-Datalines.sas
Demonstrates working with raw and structured data:

✅ DATA Step with SET statement

✅ Creating new variables from existing variables

✅ Reading raw data using DATALINES

✅ Column input for fixed-width data

✅ Using informats for proper date handling

Example excerpt:

data demographics_cols;
    input Name $ 1-5 Age 6-8 State $ 9-11 Weight 12-15;
    datalines;
Marie 25 WV 132
Adam 41 CA 210
;
run;

data airline_create;
    set sashelp.airline;
    Month = month(date);
run;

✅ Skills Demonstrated

This SAS portfolio demonstrates proficiency in:

📌 Data Manipulation & Programming

Creating, importing, and modifying datasets

Creating new variables

Conditional logic (IF/THEN/ELSE)

Iterative DO loops & DO UNTIL loops

Sorting, subsetting, and filtering data

📌 Statistical Analysis

One-sample, two-sample, and paired t-tests

One-way and two-way ANOVA

Tukey post-hoc comparison

Correlation analysis

Frequency/crosstab tables

Summary statistics

📌 Predictive Modeling

Simple linear regression

Multiple regression & multicollinearity assessment (VIF)

Logistic regression (binary classification)

📌 Visualization

Scatterplots and correlation plots through PROC CORR

✅ How to Use

Clone the repository or download any .sas file.
All scripts run using SAS 9.4 or SAS OnDemand for Academics.

✅ About This Repository

This SAS portfolio is intended to demonstrate competency in statistical programming, data analysis, and model building using SAS. The examples reflect skills applicable to:

Data Analyst roles

Biostatistics / Clinical Research

Public Health Analytics

Business & Marketing Analytics

Research Programming
