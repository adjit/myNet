function normalizedTestData = GetNormalizedTestData(arr)
    for i=1:size(arr,1)
        [nArr, min, max] = zeroOneNormalize(arr(i,:));
        if i == 1
            normalizedTestData = [InputData(nArr, min, max)];
        else
            normalizedTestData = [normalizedTestData; InputData(nArr, min, max)];
        end
    end
end