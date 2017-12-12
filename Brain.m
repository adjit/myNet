classdef Brain
    %BRAIN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        TrainSet
        ValidationSet
        TestingSet
        
        NeuralNetwork
        NetworkLayers
        
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
            
            %   Sets NetworkLayers to the correct number of layers. In the
            %   base case, it is set to 3 Layer. Input, Hidden, Output
            obj.NetworkLayers = 3;
            
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
        
        function obj = SetNetwork(obj)
            obj.NeuralNetwork = NeuralNet(3);
            obj.NeuralNetwork.InputLayer.Input = obj.TrainSet.NeuronInput;
            
            obj.NeuralNetwork.NeuralLayers = NeuralLayer(obj.NeuralNetwork.InputLayer.Input * obj.NeuralNetwork.InputLayer.OutputWeights, 2);
            obj.NeuralNetwork.NeuralLayers(1,1).Activated = obj.NeuralNetwork.NeuralLayers(1,1).Activate();
            for i=3:obj.NeuralNetwork.LayerCount
                obj.NeuralNetwork.NeuralLayers = [obj.NeuralNetwork.NeuralLayers 
                    NeuralLayer(obj.NeuralNetwork.NeuralLayers(1,i-1).Activated * obj.NeuralNetwork.NeuralLayers(1,i-1).OutputWeights, size(obj.NeuralNetwork.NeuralLayers(1,i-1).OutputWeights,1))];
            end
            
        end
        
        function obj = ForwardPropagation(obj)
            
        end
    end
end

