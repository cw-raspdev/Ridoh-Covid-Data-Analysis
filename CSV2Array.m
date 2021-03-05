Testsheet = detectImportOptions('RIDOHData.csv');
Testsheet.VariableNamingRule = 'preserve';
%disp(Testsheet.VariableNames);
Testsheet = setvartype(Testsheet,'string'); %takes out the specific columns which don't just containnumbers
StringVersion = readmatrix('RIDOHData.csv', Testsheet);
Testsheet = setvartype(Testsheet,'double'); %takes out the specific columns which don't just containnumbers
%%
DoubleVersion = readmatrix('RIDOHData.csv', Testsheet);
for ii = 1:size(DoubleVersion, 1)
    for jj = 1:size(DoubleVersion, 2)
    if isnan(DoubleVersion(ii, jj))
        StringVersion = strtok(StringVersion, '%');
        StringVersion = strtok(StringVersion, '<');
    end
    end
end
%disp(StringVersion);
%%
CityNames = StringVersion(3, 2:end);
DoubleVersion = str2double(StringVersion(4:end, 2:end));
x = array2table(DoubleVersion, 'VariableNames', CityNames)