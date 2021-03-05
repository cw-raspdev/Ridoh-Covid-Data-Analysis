Testsheet = detectImportOptions('RIDOHData.csv');
Testsheet.VariableNamingRule = 'preserve';
%disp(Testsheet.VariableNames);
Testsheet = setvartype(Testsheet,'string');
StringVersion = readmatrix('RIDOHData.csv', Testsheet);
%creates a string matrix that we can edit 
Testsheet = setvartype(Testsheet,'double'); 
DoubleVersion = readmatrix('RIDOHData.csv', Testsheet);
%% DoubleVersion turns all non-numbers into NaN values
for ii = 1:size(DoubleVersion, 1)
    for jj = 1:size(DoubleVersion, 2)
    if isnan(DoubleVersion(ii, jj))
        Tester = StringVersion(ii, jj);
        Tester = strtok(Tester, '%');
        Tester = strtok(Tester, '<');
        StringVersion(ii, jj) = Tester;
    end
    end
end
%disp(StringVersion);
%%
CityNames = StringVersion(3, 2:end);
DoubleVersion = str2double(StringVersion(4:end, 2:end));
x = array2table(DoubleVersion, 'VariableNames', CityNames)