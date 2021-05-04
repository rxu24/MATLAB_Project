% Machine Learning Test - Object Detection
% Ruidi Xu

%% Label Data
% imds = imageDatastore('C:/Users/ruidi/Documents/MATLAB/Honors Capstone/Images');
% imageLabeler(imds)

%% Load Ground Truth
% cd Images;
% data = load('skullTrainingGroundTruth.mat');
% gTruth = data.gTruth;
% cd ../
%% Create new training network
% [imds,bxds] = objectDetectorTrainingData(gTruth);
% cds = combine(imds,bxds);

%% First time - initialize YOLO v2 detection network based on ResNet-50
% tempdir = 'C:/Users/ruidi/Documents/MATLAB/Honors Capstone/Images';
% options = trainingOptions('sgdm', ...
%        'InitialLearnRate', 0.001, ...
%        'Verbose',true, ...
%        'MiniBatchSize',16, ...
%        'MaxEpochs',30, ...
%        'Shuffle','every-epoch', ...
%        'VerboseFrequency',10,...
%        'CheckpointPath',tempdir); 
% 
% inputSize = [250 250 3];
% numClasses = 4;
% trainingDataForEstimation = cds; % combined data set previously
% numAnchors = 7;
% [anchorBoxes, meanIoU] = estimateAnchorBoxes(trainingDataForEstimation, numAnchors)
% featureExtractionNetwork = resnet50; % requires installation of ResNet-50 support package
% featureLayer = 'activation_40_relu';
% lgraph = yolov2Layers(inputSize,numClasses,anchorBoxes,featureExtractionNetwork,featureLayer);

%% Train detection network (remember to pull from checkpoint)
% %[detector,info] = trainYOLOv2ObjectDetector(cds,lgraph,options); %begin training
% 
% tempdir = 'C:/Users/ruidi/Documents/MATLAB/Honors Capstone/Images';
% options = trainingOptions('sgdm', ...
%        'InitialLearnRate', 0.001, ...
%        'Verbose',true, ...
%        'MiniBatchSize',16, ...
%        'MaxEpochs',60, ... % change MaxEpochs (iterations)
%        'Shuffle','every-epoch', ...
%        'VerboseFrequency',1,...
%        'CheckpointPath',tempdir);
% data = load('C:/Users/ruidi/Documents/MATLAB/Honors Capstone/Images/yolov2_checkpoint__60__2021_04_20__13_50_38.mat');
% checkpoint = data.detector;
% detector = trainYOLOv2ObjectDetector(cds,checkpoint,options); % train from checkpoint

%% Test trained network on new image - display results
I = imread('test_image.png');
J = imresize(I, [250,250]);
[bboxes,scores,labels] = detect(detector,J);
labels_string = cellstr(labels)
if(~isempty(bboxes))
  J = insertObjectAnnotation(J,'rectangle',bboxes,scores);
end
figure
imshow(J)

I = imread('test_image.png');
J = imresize(I, [250,250]);
[bboxes,scores,labels] = detect(detector,J);
labels_string = cellstr(labels)
if(~isempty(bboxes))
  J = insertObjectAnnotation(J,'rectangle',bboxes,labels);
end
figure
imshow(J)
