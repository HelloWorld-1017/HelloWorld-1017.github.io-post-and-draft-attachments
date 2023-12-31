% MATLAB official example: Train Network for Sequence Classification
clc,clear,close all

[XTrain,YTrain] = japaneseVowelsTrainData;
[XTest,YTest] = japaneseVowelsTestData;

inputSize = 12;
numHiddenUnits = 100;
numClasses = 9;

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

maxEpochs = 70;
miniBatchSize = 27;

options = trainingOptions('sgdm', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'ValidationData', {XTest,YTest},...
    'ValidationFrequency', 10,...
    'GradientThreshold',1, ...
    'Verbose',false, ...
    'Plots','training-progress',...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropPeriod',30,...
    'LearnRateDropFactor',0.3);

[net,info] = trainNetwork(XTrain,YTrain,layers,options);




