%unemployment rates vs average cases
Testsheet = detectImportOptions('unemploymentrates.csv');
Testsheet = setvartype(Testsheet,'string');
StringVersion = readmatrix('unemploymentrates.csv', Testsheet);
Testsheet = setvartype(Testsheet,'double');
DoubleVersion2 = readmatrix('unemploymentrates.csv', Testsheet);
    % creates a double (number) matrix from which we can detect NaN values
%% Using strtok to clean up nonstandard numerical data
for ii = 1:size(DoubleVersion2, 1)
    % DoubleVersion and StringVersion are the same values but diff. formats
    for jj = 1:size(DoubleVersion2, 2)
        if isnan(DoubleVersion2(ii, jj)) 
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
unemployment_rate = DoubleVersion2(:,2); 
CategNames1 = rot90(CategNames,3);
CategNames1(end)=[]; %removes 'Total' string from category names
CategNames1(end) = []; %removes 'Unknown' string from category names
%The line CategNames1(end) = []; can be used as many times as needed to remove
%values from start/end of CategNames1. Replace end with 1 to remove values
%from start.
table1 = [CategNames1, unemployment_rate, avg_cases(1:end-2)]
scatterdata = str2double( table1 );
scatter(scatterdata(:,2),scatterdata(:,3))
