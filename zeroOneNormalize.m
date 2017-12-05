function [nArr, min, max] = zeroOneNormalize(arr)
%Normalizes a row of the input array and returns an array of
%   normalized data between 0 and 1

    nArr = zeros(1, size(arr,2));
    max = 0;
    min = 10000;
    for j = 1:size(arr,1)
        for i=1:size(arr,2)
           num = arr(j, i);
           if(num > max)
               max = num;
           end
           if(num < min)
               min = num;
           end
           nArr(1,i) = num;
        end
    end

    for i=1:size(nArr, 2)
        num = nArr(1, i);
        nArr(1, i) = (num - min)/(max - min);
    end
end