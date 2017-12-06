% root_folder = Constants.STEPHS_DIRECTORY; 
% categories = {'corgi_data','bread_data'};
% imgs = imageDatastore(fullfile(root_folder, categories),'LabelSource', ...
%     'foldernames', 'IncludeSubfolders', true, 'FileExtensions', '.jpg');
% imgs.ReadFcn = @(loc)imresize(imread(loc),[Constants.IMG_SIZE, Constants.IMG_SIZE]); % resize images
% N = numel(imgs.Files);
% imageSize = nan(N,2);
% for i = 1:N
%    try
%        img = readimage(imgs,i);
% %        fprintf('File #: %d\nSize %d-by-%d-by-%d\n', i, size(img,1), size(img,2), size(img,3));
%        if(size(img,3) < 3)
%             delete(imgs.Files{i}); % delete non rbg photos
%             disp(i);
%        end
%    catch
%         delete(imgs.Files{i}); % delete corrupt images
%         disp(i);
%    end
% end
% 
% [train, test] = splitEachLabel(imgs, Constants.TRAINING_SIZE, 'randomize'); 
% options = trainingOptions('sgdm', 'MaxEpochs', 3, 'InitialLearnRate', ...
%     .001);
% layers = [imageInputLayer([Constants.IMG_SIZE Constants.IMG_SIZE 3])
%           fullyConnectedLayer(2)
%           softmaxLayer
%           classificationLayer];
% net = trainNetwork(train, layers, options);
% test_output = classify(net, test);
% accuracy = sum(test_output == test.Labels)/length(test_output); 

m = numel(test.Files);
predictedT = table(test_output);
actualT = table(test.Labels);
predicted_ = table2cell(predictedT);
actual_ = table2cell(actualT);

counter = 1;
for i = 1:(m/10)
    if(predicted_{i} ~= actual_{i})
        
        disp(test.Files{i});
%         subplot(10, 10, counter), imshow(testImg);
        disp("Wrong at index #");
        disp(i);
        counter = counter + 1;
    end
     
 end
