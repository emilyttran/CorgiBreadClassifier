% ================== SETUP ================== %
root_folder = Constants.STEPHS_DIRECTORY; 
[train, test, layers, options] = setupCNN(root_folder);   

% ================== TRAIN ================== %
net = trainNetwork(train, layers, options);

% ================= RESULTS ================= %
predicted_labels = classify(net, test);
accuracy = sum(predicted_labels == test.Labels)/length(predicted_labels); 
displayMislabeledImages(test, predicted_labels, Constants.NUM_OF_MISLABELED);








% classification_layer = 11;
% trainingFeature = activations(net, train, classification_layer);

% testFeatures = activations(net, test, classification_layer);
% logical_actual = test.Labels == "corgi";
% logical_predicted = predicted_labels == "corgi";
% dummy_actual = dummyvar(double(logical_actual)+1);
% dummy_predicted = dummyvar(double(logical_predicted)+1);
% plotconfusion(dummy_actual, dummy_predicted);


% confusion_matrix = confusionmat(test.Labels, predicted_labels);
% confusion_matrix = confusion_matrix./sum(confusion_matrix,2);
% mean(diag(confusion_matrix));
