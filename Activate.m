function [activated,activatedPrime] = Activate(inputSum, activator)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    activator = upper(activator);
    activated = [];
    activatedPrime = [];

    if(activator == "SIGMOID")
        [activated, activatedPrime] = arrayfun(@(x) Sigmoid(x), inputSum);
        %activatedPrime = arrayfun(@(x) SigmoidPrime(x), inputSum);
    %elseif(activator == "TANH")
    %   TANH function not included yet

    end
end

