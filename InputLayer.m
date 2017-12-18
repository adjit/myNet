classdef InputLayer
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Input
        OutputWeights
        NewWeights
    end
    
    methods
        function obj = InputLayer(input, numLayers)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.Input = input;
            
            %   Second dimension 2 is the number of neurons in the next
            %   layer. Since it will be a 3-2-1 network, it is 2 for now
            obj.OutputWeights = rand(size(obj.Input, 2), numLayers-1);
        end
    end
end

