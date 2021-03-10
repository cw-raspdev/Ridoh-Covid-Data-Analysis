=================================================%==============================================================
%Approx 6 hrs
%Map the Covid data to the Rhode Island ZipCode Map
%Data Format
% Must be in an csv file foramt 
%    FIle must be all data No Column Headers or text allowed
%    All data on the file must be numberic 
%    Note the standard RI Covid Datasheet has the ZipCode defined as text
%         You must change numeric text to numbers
%
% Column 1: ZipCode
% Column 2: Total Number of Covid Cases
%==============================================================

% data1 = readmatrix("RICovidData.csv","Sheet1");
data1 = readmatrix("RICovidData.csv");

%Return Value for MapCovidCases is 0 if the function worked without errors
RI = MapCovidCases(data1);

%Show the Rhode Island ZipCode Covid Map
imshow(RI);
disp("Done");

    

