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
            obj.NetworkLayers = 5;
            
            obj = obj.SetNetwork();
            %obj = obj.BackPropagation();
            
            %Checks if bias flag is set to TRUE
%             if bias == 'true'
%                 obj.NeuralInput = [obj.TrainSet.NeuronInput ones(size(obj.TrainSet.NeuronInput,1),1)];
%             else
%                 obj.NeuralInput = obj.TrainSet.NeuronInput;
%             end
            
            obj.NeuralResults = obj.TrainSet.NeuronResult;
%{
OLD TEST RUN
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
%}
        end
        
        function obj = SetNetwork(obj)
            obj.NeuralNetwork = NeuralNet(obj.NetworkLayers);
            obj.NeuralNetwork.InputLayer = InputLayer(obj.TrainSet.NeuronInput, obj.NetworkLayers);
            
            %   Arg2 of NeuralLayer is the number of output neurons. As of now
            %   hardcoded to 2, as for a 3-2-1 NN. In the future will probably
            %   do as a factor of the NeuralNetwork LayerCount (ie NeuralNetwork.LayerCount - 1)
            obj.NeuralNetwork.NeuralLayers = NeuralLayer(obj.NeuralNetwork.InputLayer.Input * obj.NeuralNetwork.InputLayer.OutputWeights, size(obj.NeuralNetwork.InputLayer.OutputWeights, 2)-1);
            
            %   In the for loop append additional NeuralLayers, while changing the output
            %   Neurons to the number of neurons in this layer - 1
            for i=2:obj.NeuralNetwork.LayerCount-2
                prevLayer = obj.NeuralNetwork.NeuralLayers(1,i-1);
                obj.NeuralNetwork.NeuralLayers = [obj.NeuralNetwork.NeuralLayers, NeuralLayer(prevLayer.Activated * prevLayer.OutputWeights, size(obj.NeuralNetwork.NeuralLayers(1,i-1).OutputWeights,2)-1)];
            end
            
            obj.NeuralNetwork.OutputLayer = OutputLayer(obj.NeuralNetwork.NeuralLayers(1, obj.NeuralNetwork.LayerCount-2).Activated * obj.NeuralNetwork.NeuralLayers(1, obj.NeuralNetwork.LayerCount-2).OutputWeights);
        end
        
        function obj = BackPropagation(obj)
            
            %   Output -> Hidden Layer
            dSum = 0;
            neuralIndex = size(obj.NeuralNetwork.NeuralLayers, 2);
            
            outputSME = obj.TrainSet.NeuronResult - obj.NeuralNetwork.OutputLayer.Activated;
            dSum = obj.NeuralNetwork.OutputLayer.ActivatedPrime.*outputSME
            
            dWeight = dSum./obj.NeuralNetwork.NeuralLayers(1, neuralIndex).Activated
            
            obj.NeuralNetwork.NeuralLayers(1, neuralIndex).NewWeights = obj.NeuralNetwork.NeuralLayers(1, neuralIndex).OutputWeights + dWeight;
            
            %   Hidden Layer -> Previous Layer
            while(neuralIndex > 0)
                neuralLayer = obj.NeuralNetwork.NeuralLayers(1, neuralIndex);
                
                dSum = ( dSum./neuralLayer.OutputWeights).*neuralLayer.ActivatedPrime;
                
                if(neuralIndex - 1 == 0)
                    dWeight = dSum./obj.NeuralNetwork.InputLayer.Input;
                    %for base case need to still move the NewWeight to the
                    %OutputWeight
                    obj.NeuralNetwork.InputLayer.NewWeights = obj.NeuralNetwork.InputLayer.OutputWeights + dWeight;
                else
                    dWeight = dSum./obj.NeuralNetwork.NeuralLayers(1, neuralIndex-1).Activated;
                    obj.NeuralNetwork.NeuralLayers(1, neuralIndex-1).NewWeights = obj.NeuralNetwork.NeuralLayers(1, neuralIndex-1).OutputWeights + dWeight;
                end
                
                %obj.NeuralNetwork.NeuralLayers(1, neuralIndex).OutputWeights = obj.NeuralNetwork.NerualLayers(1, neuralIndex).NewWeights;
                
                neuralIndex = neuralIndex - 1;
            end
            
           %obj.NeuralNetwork.InputLayer.OutputWeights = obj.NeuralNetwork.InputLayer.NewWeights;
        end
        
        function obj = ForwardPropagation(obj)
            
        end
    end
end

