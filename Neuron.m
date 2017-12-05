classdef Neuron
    %NEURON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Input_Sum
        Activated_Value
        Weight_In
        Weight_Out
        Old_Weight_in
        Old_Weight_Out
    end
    
    methods
        function obj = Neuron(inputArg1,inputArg2)
            %NEURON Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

