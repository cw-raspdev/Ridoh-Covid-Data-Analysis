# boolean-fishes
Initial Project Proposal and Schedule available at this Google Docs link: 
https://docs.google.com/document/d/17aVST-bbTC88z5P54zGlMEIqZ03CCjrpQOnj3PcJPf8/edit
 
This project is a collection of programs that analyzes .csv files about COVID trends, formatted on RI Department of Health’s COVID database (https://docs.google.com/spreadsheets/d/1c2QrNMz8pIbYEKzMJL7Uh2dtThOJa2j1sSMwiDo5Gz4/edit#gid=264100583)
 
First run CSV2Array.m to convert .csv file to an array. You can press the RUN button as is, or run it as a function if you take out the percent sign in line one and put a function call in the command window. Then it will ask you for file name, so input the csv file that you want to read with the .csv extension attached, as a string (with the two single quotes). 
    For example: 'RIDOHData.csv' is a database which gives the number of cases per RI city per week, from last March until 2021 February when we last downloaded the file.
*Note: CSV2Array is set up to run with data sheets labeled “Trend” and “Rate Trend” in the RIDOH Covid19 Database. For your testing convenience, we downloaded the data sheets in .csv format on 3/8 and stored them in the repository under ALLRidohData. 
 
Then, t_tester.m compares each city against each other city by running two-sample t tests.
It then takes the five lowest p-values for the t-tests and puts them in an array (displayed in command window). 
You can jot the names of the pairings down and compare those cities' values, which should be largest apart/most significant.
t_tester.m also creates a histogram of the p-values, and you can specify the width of bars for said histogram.
One application of the histogram: see how many times you fail to reject the null hypothesis,
for a given confidence interval. Ex: for 95% confidence interval, set width of bars
to 0.05 and you will be able to see how many sets of cities reject the null hypothesis,
in the first bar from 0 to 0.05.

To access scatter plots comparing average cases to economic characteristics:
Scatterplot.m compares the median income of every county to the average covid cases (mean of the given time frame). Scatterplot2.m compares the average unemployment rates of every county from 2019-2020 with  the same metric (average cases). 
For both scatterplots:
The scripts are set up to run with data sheets labeled “Trend” but not “Rate Trends” because there is a population row in “Rate Trends” that needs to be eliminated. If running “Rate Trends” with these scripts you must remove the population row, either before CSV2Array or after.
First run CSV2Array.m (follow instructions above)- this will generate the variables for the covid data being used
Then run the chosen scatterplot code: the first part of the code will generate the economic characteristic variable, and the second part merges it with the covid data and creates the visual displays.
The code will first produce a table with the columns of county names and the two variables, and then create a scatter plot to show the correlation. 
 
RunCovidMap.m creates a zip code map that shows the COVID cases per 100,000 population in each postal code, based on a gradient. RICovidData was the only data that was divided by zip code. ChangeColor.m takes an image of a zip code map of Rhode Island and isolates the unique colors of the individual zip codes. MapCovidCases.m reads the data in RICovidData and replaces the color with a shade of red. The data point within a certain range will translate to a shade of red, the darkest red representing the highest rate of COVID cases per 100,000 population.  RunCovidMap.m will display the final map and is the only file that needs to be run. 
