classdef OutputLayer
    %OUTPUTLAYER is a class which contains the output layer of the Neural
    %Network
    %   The OutputLayer will contain the inputSum as well as the activated
    %   layer. This differs from the NeuralLayer and InputLayer in that it
    %   only has the inputSum and Activation, as those are the only values
    %   that are required for this layer.
    
    properties
        InputSum
        Activated
    end
    
    methods
        function obj = OutputLayer(inputSum)
            %OutputLayer Constructs an instance of this class
            %   It takes the input sum and activates this layer upon
            %   construction
            obj.InputSum = inputSum;
            
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

