%In order to change whether or not there is Bias, need to make changes in Brain.m and getNeuronInput.m

DataImport

rawData = GetRawTestData(importData);
trainingData = GetNormalizedTestData(rawData,1,60);
testingData = GetNormalizedTestData(rawData,48,108);

testBrain = Brain(trainingData(5,1),"false");
biasedTestBrain = Brain(trainingData(5,1),"true");

plot(testBrain.DeNormalizedOutput);
hold on
plot(biasedTestBrain.DeNormalizedOutput);
hold on
plot(testBrain.DeNormalizedActual)
hold off
legend("Non-Biased Output", "Biased Output", "Actual Result");

accuracyMeasure = zeros(size(testBrain.NeuralResults));

for i=1:size(testBrain.NeuralResults, 1)
    accuracyMeasure(i,1) = (abs(testBrain.NeuralResults(i,1) - testBrain.OutputActivation(i,1))/testBrain.NeuralResults(i,1))*100;
end