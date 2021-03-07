%average cases vs median income 
Testsheet = detectImportOptions('MedianIncome.csv')
Testsheet = setvartype(Testsheet,'string');
StringVersion = readmatrix('MedianIncome.csv', Testsheet);
Testsheet = setvartype(Testsheet,'double');
DoubleVersion1 = readmatrix('MedianIncome.csv', Testsheet);
    % creates a double (number) matrix from which we can detect NaN values
%% Using strtok to clean up nonstandard numerical data
for ii = 1:size(DoubleVersion1, 1)
    % DoubleVersion and StringVersion are the same values but diff. formats
    for jj = 1:size(DoubleVersion1, 2)
        if isnan(DoubleVersion1(ii, jj)) 
        % gives all values of DoubleVersion that are "not a number"
            Tester = StringVersion(ii, jj);
            Tester = strtok(Tester, '%'); %chops off '%' from Tester value
            Tester = strtok(Tester, '<'); %chops off '<' from Tester value
            StringVersion(ii, jj) = Tester;
        %Tester is only ever one number at a time
        end
    end
end

DoubleVersion1 = str2double(StringVersion);
misc = [1 1 1 1]; 
DoubleVersion1 = [misc; DoubleVersion1]
        


%%
avg_cases = rot90(mean(DoubleVersion),3)
median_income = DoubleVersion1(:,3) 
array2table(avg_cases) 
array2table(median_income)
x = array2table(DoubleVersion,'RowNames', CategNames)
table1 = [CategNames, avg_cases]
table2 = [CategNames, median_income]
table = join(table1, table2)
