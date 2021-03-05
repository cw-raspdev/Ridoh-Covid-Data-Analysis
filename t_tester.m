global ProcessedSheet
global CityNames
tests = [];
pvalues = [];
CityDifference = [];
for ii = 1:size(ProcessedSheet, 2)-1
    for jj = 1:size(ProcessedSheet, 2)-1
    %FIRST: Do T-Test
    Sample1 = ProcessedSheet(:, ii);
    Sample2 = ProcessedSheet(:, jj);
    [t, p] = ttest2(Sample1, Sample2);
    tests = [tests, t];
    pvalues = [pvalues; p];
    %SECOND: Get Label for Samples of T-Test
    CityDifference = [CityDifference, append(CityNames(jj), '-', CityNames(ii))];
    end
end
%% Display T-test and p-values
TwosampleTtest = tests(:);
x = array2table(TwosampleTtest, 'RowNames', CityDifference);
y = table(x, pvalues);
%% Display lowest p-value
RejectNull = nnz(TwosampleTtest)
disp 'The p-value is the probability of obtaining results at least as extreme as the observed results of a statistical hypothesis test'
[B, I] = mink(pvalues, 5)
lowestPs = [CityDifference(I(1:end)), B]