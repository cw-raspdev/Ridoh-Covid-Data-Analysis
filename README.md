# boolean-fishes
Initial Project Proposal and Schedule available at this Google Docs link: 
https://docs.google.com/document/d/17aVST-bbTC88z5P54zGlMEIqZ03CCjrpQOnj3PcJPf8/edit

This code reads Google Docs-downloaded .csv files

First run CSV2Array.m to convert .csv file to an array. Please copy the function call: 
    [ProcessedSheet, ProcessedTable] = CSV2Array
and input it in the command window. It will ask you for file name, and input the csv
file with the .csv extension attached, as a string (with the two single quotes). 
    For example: 'RIDOHData.csv' which gives the number of cases per RI city per week,
from last March until 2021 February when we last downloaded the file.

Then, t_tester.m compares each city against each other city by running two-sample t tests.
It then takes the five lowest p-values for the t-tests and puts them in an array (displayed in command window)
t_tester.m also creates a histogram of the p-values, and you can specify the width of bars for said histogram.
One application of the histogram: see how many times you fail to reject the null hypothesis,
for a given confidence interval. Ex: for 95% confidence interval, set width of bars
to 0.05 and you will be able to see how many sets of cities reject the null hypothesis,
in the first bar from 0 to 0.05.
