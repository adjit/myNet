classdef NeuralNet
    %NEURALNET Summary of this class goes here
    %   Detailed explanation goes here

     properties
         InputLayer
         NeuralLayers
         OutputLayer
         LayerCount
     end

     methods
         function obj = NeuralNet(layers)
             obj.LayerCount = layers;
             obj.NeuralLayers = [];             
         end
     end

end