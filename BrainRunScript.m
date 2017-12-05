DataImport

rawData = GetRawTestData(importData);
trainingData = GetNormalizedTestData(rawData,1,60);
testingData = GetNormalizedTestData(rawData,48,108);

testBrain = Brain(trainingData(5,1));

accuracyMeasure = zeros(size(testBrain.NeuralResults));

for i=1:size(testBrain.NeuralResults, 1)
    accuracyMeasure(i,1) = (abs(testBrain.NeuralResults(i,1) - testBrain.OutputActivation(i,1))/testBrain.NeuralResults(i,1))*100;
end