function [nArr, max, min] = zeroOneNormalize_v2(arr, row)
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