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
            [obj.NeuronInput, obj.NeuronResult] = getNeuronInput(obj.Input_Set);
        end
    end
end

