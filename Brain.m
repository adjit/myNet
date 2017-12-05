classdef Brain
    %BRAIN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        TrainSet
        NeuralInput
        NeuralResults
        InputHiddenWeights
        HiddenSum
        HiddenActivation
        HiddenOutputWeights
        OutputSum
        OutputActivation
        DeNormalizedOutput
        DeNormalizedActual
    end
    
    methods
        function obj = Brain(trainingInputData, bias)
            %BRAIN Construct an instance of this class
            %   Detailed explanation goes here
            obj.TrainSet = trainingInputData;
            
            %Checks if bias flag is set to TRUE
            if bias == "true"
                obj.NeuralInput = [obj.TrainSet.NeuronInput ones(size(obj.TrainSet.NeuronInput,1),1)];
            else
                obj.NeuralInput = obj.TrainSet.NeuronInput;
            end
            
            obj.NeuralResults = obj.TrainSet.NeuronResult;

            %Input Hidden Weights
            %   the second parameter of rand represents the number of
            %   neurons in the hidden layer which receive input from the
            %   input layer. Even though this Neural Network is a 4-3-1,
            %   each layer has a bias, and the bias's do not receive input
            %   from the previous layer
            obj.InputHiddenWeights = rand(size(obj.NeuralInput,2),2);
            obj.HiddenSum = obj.NeuralInput * obj.InputHiddenWeights;
            obj.HiddenActivation = arrayfun(@(x) Sigmoid(x),obj.HiddenSum);
            %
            %Removed Bias from Network, unless bias flag set to TRUE
            if bias=="true"
                obj.HiddenActivation = [obj.HiddenActivation ones(size(obj.HiddenActivation,1),1)];
            end
            %
            obj.HiddenOutputWeights = rand(size(obj.HiddenActivation, 2), 1);
            obj.OutputSum = obj.HiddenActivation * obj.HiddenOutputWeights;
            obj.OutputActivation = arrayfun(@(x) Sigmoid(x),obj.OutputSum);
            obj.DeNormalizedOutput = DeNormalize(obj.OutputActivation, obj.TrainSet.Min, obj.TrainSet.Max);
            obj.DeNormalizedActual = DeNormalize(obj.NeuralResults, obj.TrainSet.Min, obj.TrainSet.Max);
        end
    end
end

