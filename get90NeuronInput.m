function [neuronInput, neuronResult] = get90NeuronInput(inputSet)
    LDIFF = 15;

    %   neuronInput establishes a matrix with rows = the size of
    %   the traning set minus the loss difference (data lost due to
    %   differencing), and columns = the number of input neurons.
    %   in our instance it is 4, we will have 3 pieces of input
    %   data from our raw data and our bias which will be 1
    %Removing Bias - below is with bias
    %neuronInput = zeros(size(inputSet,2)-LDIFF,4);
    neuronInput = zeros( floor((size(inputSet,2)-LDIFF)/3),4);

    %   neuronResult establishes the actual output that we are
    %   trying to achieve through the neuron input
    neuronResult = zeros(floor((size(inputSet,2)-LDIFF)/3),1);
    inputRow = 1;

    for i=LDIFF:3:size(inputSet,2)
        inputCol = i-LDIFF+1;

        %   Neuron 1
        %   Previous Month of Previous Year T-13
        neuronInput(inputRow,1) = mean(inputSet(1, inputCol:inputCol+2));

        %   Neuron 2
        %   Same Month of Previous Year T-12
        neuronInput(inputRow,2) = mean(inputSet(1, inputCol+3:inputCol+5));
        
        %   Neuron 3
        %   Same Month of Previous Year T-12
        neuronInput(inputRow,3) = mean(inputSet(1, inputCol+6:inputCol+8));
        
        %   Neuron 4
        %   Same Month of Previous Year T-12
        neuronInput(inputRow,4) = mean(inputSet(1, inputCol+9:inputCol+11));
        
        %   Neuron Result
        %   This is the actual result we are looking for in our
        %   data. This will be used to test accuracy
        neuronResult(inputRow,1) = mean(inputSet(1, i-2:i));
        inputRow = inputRow + 1;
    end
end 