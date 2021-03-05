%% Creating double/string formats from .csv file
Testsheet = detectImportOptions('RIDOHData.csv');
Testsheet = setvartype(Testsheet,'string');
StringVersion = readmatrix('RIDOHData.csv', Testsheet);
    % creates a string matrix that we can edit
Testsheet = setvartype(Testsheet,'double');
DoubleVersion = readmatrix('RIDOHData.csv', Testsheet);
    % creates a double (number) matrix from which we can detect NaN values
%% Using strtok to clean up nonstandard numerical data
for ii = 1:size(DoubleVersion, 1)
    % DoubleVersion and StringVersion are the same values but diff. formats
    for jj = 1:size(DoubleVersion, 2)
        if isnan(DoubleVersion(ii, jj)) 
        % gives all values of DoubleVersion that are "not a number"
            Tester = StringVersion(ii, jj);
            Tester = strtok(Tester, '%'); %chops off '%' from Tester value
            Tester = strtok(Tester, '<'); %chops off '<' from Tester value
            StringVersion(ii, jj) = Tester;
        %Tester is only ever one number at a time
        end
    end
end
%% Converting edited string format to double format and displaying it
CityNames = StringVersion(3, 2:end);
    % creates a 1x41 string matrix with names of cities. Useful(hopefully)
    % for displaying info.
DoubleVersion = str2double(StringVersion(4:end, 2:end));
    % Cropped out values in the StringVersion that would just turn to NaN
x = array2table(DoubleVersion, 'VariableNames', CityNames)