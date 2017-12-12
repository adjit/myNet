classdef NeuralLayer
    %NEURALLAYER Is one layer of the Neural Network
    %   This Neural Layer will contain the input sum from the previous layer
    %   The activated value of the input sum, the output weights (which are
    %   set randomly upon initialization) and a NewWeight temp holder for the
    %   new weights during back propagation

     properties
         InputSum
         Activated
         OutputWeights
         NewWeights
     end

     methods
         function obj = NeuralLayer(inputSum, numOutputNeurons)
             obj.InputSum = inputSum;
             obj.Activated = Activate(obj);
             obj.OutputWeights = rand(size(obj.InputSum, 2), numOutputNeurons);
         end
         
         function activated = Activate(obj)
             activated = arrayfun(@(x) Sigmoid(x), obj.InputSum);
         end
     end
end