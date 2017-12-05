classdef InputData
    %InputData is an object that contains a set of normalized data with its
    %min and max normalization values
    %   The normalized data set is normalized to a value between 0 and 1.
    %   In order to later on un-normalize the neural networks predicted
    %   output, we need the min and the max values used to normalize the
    %   data
    
    properties
        Input_Set
        NeuronInput
        NeuronResult
        Min
        Max
    end
    
    methods
        function obj = InputData(inputSet,min, max)
            %InputData Construct an instance of this class
            %   Detailed explanation goes here
            obj.Input_Set = inputSet;
            obj.Min = min;
            obj.Max = max;
            [obj.NeuronInput, obj.NeuronResult] = getNeuronInput();
        end
    end
    
    methods(Static)
       function [neuronInput, neuronResult] = getNeuronInput()
            LDIFF = 13;
            
            %   neuronInput establishes a matrix with rows = the size of
            %   the traning set minus the loss difference (data lost due to
            %   differencing), and columns = the number of input neurons.
            %   in our instance it is 4, we will have 3 pieces of input
            %   data from our raw data and our bias which will be 1
            neuronInput = zeros(size(obj.Input_Set,2)-LDIFF,4);
            
            %   neuronResult establishes the actual output that we are
            %   trying to achieve through the neuron input
            neuronResult = zeros(size(obj.Input_Set,2)-LDIFF,1);
            
            for i=LDIFF+1:size(obj.Input_Set,2)
                inputRow = i-LDIFF;
                inputCol = inputRow;
                
                %   Neuron 1
                %   Previous Month of Previous Year T-13
                neuronInput(inputRow,1) = obj.Input_Set(1, inputCol);
                
                %   Neuron 2
                %   Same Month of Previous Year T-12
                neuronInput(inputRow,2) = obj.Input_Set(1, inputCol+1);
                
                %   Neuron 3
                %   Previous Month of the Same Year T-1
                neuronInput(inputRow,3) = obj.Input_Set(1, i-1);
                
                %   Neuron 4
                %   Bias = 1
                neuronInput(inputRow,4) = 1;
                
                %   Neuron Result
                %   This is the actual result we are looking for in our
                %   data. This will be used to test accuracy
                neuronResult(inputRow,1) = obj.Input_Set(1, i);
            end
        end 
    end
end

