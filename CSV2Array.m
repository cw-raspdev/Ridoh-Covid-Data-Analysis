opts = detectImportOptions('testsheet1.csv');
opts.VariableNamingRule = 'modify';
disp(opts.VariableNames);
opts = setvartype(opts,'double'); %assumes everything is a number
opts = setvartype(opts, 4, 'string'); %takes out the specific columns which don't just containnumbers
A = readtable('testsheet1.csv', opts);
disp(A)
%readtable seems to work for sets of mixed numeric data rather than
%readmatrix. here's a forum link to reference for next time: 
%https://www.mathworks.com/matlabcentral/answers/458100-difference-between-readmatrix-and-readtable