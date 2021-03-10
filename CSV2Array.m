%function [ProcessedSheet, ProcessedTable] = CSV2Array
global CategNames
global ProcessedSheet
global filename
global Testsheet
filename = input('Enter File Name with single quotes and extension: ');
%% Creating double/string formats from .csv file
Testsheet = detectImportOptions(filename);
Testsheet = setvartype(Testsheet,'string');
StringVersion = readmatrix(filename, Testsheet);
    % creates a string matrix that we can edit
Testsheet = setvartype(Testsheet,'double');
DoubleVersion = readmatrix(filename, Testsheet);
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


%disp(StringVersion);
%%
CategNames = StringVersion(3, 2:end);
DoubleVersion = str2double(StringVersion(4:end, 2:end));
x = array2table(DoubleVersion, 'VariableNames', CategNames)


%% Converting, displaying, and globalizing
CategNames = StringVersion(3, 2:end);
    % creates a 1x41 string matrix with names of cities. Useful(hopefully)
    % for displaying info.
DoubleVersion = str2double(StringVersion(4:end, 2:end));
    % Cropped out values in the StringVersion that would just turn to NaN
ProcessedTable = array2table(DoubleVersion, 'VariableNames', CategNames);
ProcessedSheet = DoubleVersion; %% DO NOT EDIT LIGHTLY
ProcessedSheet = DoubleVersion; %% DO NOT EDIT LIGHTLY

