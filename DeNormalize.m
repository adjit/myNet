function dNarr = DeNormalize(nArr, min, max)
    dNarr = zeros(size(nArr));
    
    for i=1:size(nArr, 2)
        for j=1:size(nArr, 1)
            dNarr(j, i) = nArr(j, i) * (max-min) + min;
        end
    end
end