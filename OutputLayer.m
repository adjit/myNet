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
        ActivatedPrime
    end
    
    methods
        function obj = OutputLayer(inputSum)
            %OutputLayer Constructs an instance of this class
            %   It takes the input sum and activates this layer upon
            %   construction
            obj.InputSum = inputSum;
            [obj.Activated, obj.ActivatedPrime] = Activate(obj.InputSum, 'SIGMOID');
        end
        
%         function activated = Activate(obj)
%             activated = arrayfun(@(x) Sigmoid(x), obj.InputSum);
%         end
%         
%         function activatedPrime = ActivatePrime(obj)
%             activatedPrime = arrayfun(@(x) SigmoidPrime(x), obj.InputSum);
%         end
    end
end

