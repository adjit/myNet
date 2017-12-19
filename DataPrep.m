%function DataPrep()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    DataImport();
    inputSet = GetRawTestData(importData);
    [neuronInput, neuronResult] = getNeuronInput(inputSet(5,:));
    
    [normalizedInputSesst, inputMin, inputMax] = zeroOneNormalize(inputSet(5, :));
    [normalizedNeuronInput, normalizedNeuronResult] = getNeuronInput(normalizedInputSet);
    
%end

