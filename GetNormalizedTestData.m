function normalizedTestData = GetNormalizedTestData(arr, startMonth, endMonth)
    for i=1:size(arr,1)
        [nArr, min, max] = zeroOneNormalize(arr(i,startMonth:endMonth));
        if i == 1
            normalizedTestData = [InputData(nArr, min, max)];
        else
            normalizedTestData = [normalizedTestData; InputData(nArr, min, max)];
        end
    end
end