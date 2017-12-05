function testData = GetRawTestData(arr)
    i_test = TestRowIndecies();
    
    testData = zeros(1, size(arr, 2));
    
    for i = 1:size(i_test, 2)
        if i == 1
           testData = [arr(i_test(1,i),:)];
        else
            testData = [testData; arr(i_test(1,i),:)];            
        end
    end
end