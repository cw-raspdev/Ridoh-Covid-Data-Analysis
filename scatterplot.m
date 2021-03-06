%average cases vs median income 
avg_cases = rot90(mean(DoubleVersion),3)

Testsheet = setvartype(Testsheet,'double');
MedianIncome = readmatrix('MedianIncome.csv', Testsheet);
median_income = MedianIncome(2:end, 3)
array2table(avg_cases) 
array2table(median_income)
joinAll = join(median_income,avg_cases,'type','rightouter','mergekeys',true)
