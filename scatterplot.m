%average cases vs median income 
avg_cases = rot90(mean(DoubleVersion),3)
median_income = medianincomecitytown0812(2:end,3) 
array2table(avg_cases) 
array2table(median_income)
joinAll = join(median_income,avg_cases,'type','rightouter','mergekeys',true)
