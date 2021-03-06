global ProcessedSheet
global CategNames
tests = [];
pvalues = [];
CategDifference = [];
for ii = 1:size(ProcessedSheet, 2)-1 %Doesn't include "total" column in ProcessedSheet
    for jj = 1:ii %these loops are setup so that there's no double-comparison
    %FIRST: Do T-Test
    Sample1 = ProcessedSheet(:, ii);
    Sample2 = ProcessedSheet(:, jj);
    [t, p] = ttest2(Sample1, Sample2);
    tests = [tests; t];
    pvalues = [pvalues; p];
    %SECOND: Get Label for Samples of T-Test
    CategDifference = [CategDifference, append(CategNames(ii), '-', CategNames(jj))];
    end
end
%% Display T-test and p-values
x = array2table(tests, 'RowNames', CategDifference);
y = table(x, pvalues)
%% Display lowest p-value
RejectNull = nnz(tests(:))
[B, I] = mink(pvalues, 5)
CategDiff1 = CategDifference(I(1:end))
lowestPs = [CategDiff1(:), B]