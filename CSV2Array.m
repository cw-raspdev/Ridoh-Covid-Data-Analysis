Testsheet = detectImportOptions('RIDOHData.csv');
Testsheet.VariableNamingRule = 'preserve';
%disp(Testsheet.VariableNames);
Testsheet = setvartype(Testsheet,'string'); %takes out the specific columns which don't just containnumbers
StringVersion = readmatrix('RIDOHData.csv', Testsheet);
Testsheet = setvartype(Testsheet,'double'); %takes out the specific columns which don't just containnumbers
DoubleVersion = readmatrix('RIDOHData.csv', Testsheet);
for ii = 1:size(DoubleVersion, 1)
    for jj = 1:size(DoubleVersion, 2)
    if isnan(DoubleVersion(ii, jj))
        StringVersion = strtok(StringVersion, '%');
        StringVersion = strtok(StringVersion, '<');
    end
    end
end
%disp(StringVersion)
DoubleVersion = str2double(StringVersion);
x = array2table(DoubleVersion);
        
%[A, B] = strtok(A, '%')
%Testsheet = setvartype(Testsheet,'double'); %assumes everything is a number
%readtable seems to work for sets of mixed numeric data rather than
%readmatrix. here's a forum link to reference for next time: 
%https://www.mathworks.com/matlabcentral/answers/458100-difference-between-readmatrix-and-readtable
%advantage of NaN is that will be excluded from mean of calculations, and
%not a zeros

