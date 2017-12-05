classdef Brain
    %BRAIN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Training_Set
        Testing_Set
    end
    
    methods
        function obj = Brain(trainingInputData, testingInputData)
            %BRAIN Construct an instance of this class
            %   Detailed explanation goes here
            obj.Training_Set = trainingInputData;
            obj.Testing_Set = testingInputData;
        end
    end
end

