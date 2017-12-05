function [nArr, max, min] = logNormalize(arr,row,numberOfYears, base)
%Normalizes a row of the input array and returns an array of
%   normalized data between 0 and 1

noms = 12;
%numberOfMonths

nArr = zeros(12, numberOfYears);
max = 0;
min = 10000;
x = 0;
y = 0;

for i=1:size(arr,2)
   num = arr(row,i);
   if(mod(i-1,noms) == 0)
       y = 1;
       x = x+1;
       if(x > numberOfYears)
           break
       end
   end
   if(num > max)
       max = num;
   end
   if(num < min)
       min = num;
   end
   nArr(y, x) = (log(num)/log(base));
   y = y+1;
end