function [inputSet] = getInputSet(arr,startMonth,endMonth)
%getInputSet returns the input set for the Neural Network
%   It takes in a matrix of size [1 x arr length]
%   it will then pass arr(1,1:months)
    ld = 13;
    
    [nArr, min, max] = zeroOneNormalize(arr(1,startMonth:endMonth));

    inputSet = zeros(size(nArr)-ld, 4);
    
    for i=ld:size(nArr, 2)
        inputRow = i-ls+1;
        inputCol = inputRow;
        inputSet(inputRow,1) = nArr(1, inputCol);
        inputSet(inputRow,2) = nArr(1, inputCol+1);
        inputSet(inputRow,3) = nArr(1, i-1);
        inputSet(inputRow,4) = nArr(1, i);
    end

end

function [nArr, max, min] = zeroOneNormalize(arr)
%Normalizes a row of the input array and returns an array of
%   normalized data between 0 and 1

    noms = 12;
    %numberOfMonths

    nArr = zeros(1, size(arr,2));
    max = 0;
    min = 10000;

    for i=1:size(arr,2)
       num = arr(row, i);
       if(num > max)
           max = num;
       end
       if(num < min)
           min = num;
       end
       nArr(1,i) = num;
    end

    for i=1:size(nArr, 2)
        num = nArr(1, i);
        nArr(1, i) = (num - min)/(max - min);
    end
end