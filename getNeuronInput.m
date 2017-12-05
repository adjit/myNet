function [neuronInput, neuronResult] = getNeuronInput(inputSet)
    LDIFF = 13;

    %   neuronInput establishes a matrix with rows = the size of
    %   the traning set minus the loss difference (data lost due to
    %   differencing), and columns = the number of input neurons.
    %   in our instance it is 4, we will have 3 pieces of input
    %   data from our raw data and our bias which will be 1
    %Removing Bias - below is with bias
    %neuronInput = zeros(size(inputSet,2)-LDIFF,4);
    neuronInput = zeros(size(inputSet,2)-LDIFF,3);

    %   neuronResult establishes the actual output that we are
    %   trying to achieve through the neuron input
    neuronResult = zeros(size(inputSet,2)-LDIFF,1);

    for i=LDIFF+1:size(inputSet,2)
        inputRow = i-LDIFF;
        inputCol = inputRow;

        %   Neuron 1
        %   Previous Month of Previous Year T-13
        neuronInput(inputRow,1) = inputSet(1, inputCol);

        %   Neuron 2
        %   Same Month of Previous Year T-12
        neuronInput(inputRow,2) = inputSet(1, inputCol+1);

        %   Neuron 3
        %   Previous Month of the Same Year T-1
        neuronInput(inputRow,3) = inputSet(1, i-1);

        %   Neuron 4
        %   Bias = 1
        %BIAS REMOVED
        %neuronInput(inputRow,4) = 1;

        %   Neuron Result
        %   This is the actual result we are looking for in our
        %   data. This will be used to test accuracy
        neuronResult(inputRow,1) = inputSet(1, i);
    end
end 