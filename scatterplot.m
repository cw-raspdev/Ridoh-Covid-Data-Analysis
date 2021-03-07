%average cases vs median income 
Testsheet = detectImportOptions('MedianIncome.csv');
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
%misc = [1 1 1 1]; 
%DoubleVersion1 = [misc; DoubleVersion1]
global CategNames


%%
global ProcessedSheet
avg_cases = rot90(mean(ProcessedSheet),3);
median_income = DoubleVersion1(3:end-1,3); 
CategNames1 = rot90(CategNames,3);
CategNames1(end)=[]; %removes 'Total' string from category names
CategNames1(end) = []; %removes 'Unknown' string from category names
%The line CategNames1(end) = []; can be used as many times as needed to remove
%values from start/end of CategNames1. Replace end with 1 to remove values
%from start.
table1 = [CategNames1, median_income, avg_cases(1:end-2)]
scatterdata = str2double( table1 );
scatter(scatterdata(:,2),scatterdata(:,3))

