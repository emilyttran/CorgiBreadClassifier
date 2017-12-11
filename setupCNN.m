function [train, test, layers, options] = setupCNN(root_folder)
% 
original_imgs = imageDatastore(fullfile(root_folder, ... 
    Constants.CATEGORIES), 'LabelSource','foldernames', ...
    'IncludeSubfolders', true, 'FileExtensions', '.jpg');
imgs = preprocessImages(original_imgs);
[train, test] = splitEachLabel(imgs, Constants.TRAINING_SIZE, 'randomize'); 
options = trainingOptions('sgdm', 'MaxEpochs', 15,'shuffle', ...
    'every-epoch','InitialLearnRate', .00001, 'ExecutionEnvironment', 'parallel');

layers = [imageInputLayer([Constants.IMG_SIZE Constants.IMG_SIZE 3])
          convolution2dLayer([5,5],20,'Padding',0,'Stride',4)
          batchNormalizationLayer
          reluLayer
          
          maxPooling2dLayer(3,'Stride',2,'Padding',0)

          convolution2dLayer([3,3],100,'Padding',2,'Stride',1)
          batchNormalizationLayer
          reluLayer
          
          maxPooling2dLayer(3,'Stride',2,'Padding',0)
 
          convolution2dLayer([2,2],150,'Padding',1,'Stride',1)
          batchNormalizationLayer
          reluLayer
           
          maxPooling2dLayer(3,'Stride',2,'Padding',0)
          fullyConnectedLayer(2)
          softmaxLayer
          classificationLayer];
end
