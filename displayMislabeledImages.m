function [] = displayMislabeledImages(test, predicted_labels, max)
%
m = numel(test.Files);
predicted = table2cell(table(predicted_labels));
actual = table2cell( table(test.Labels));

square_root = ceil(sqrt(max));
counter = 1;
figure;
for i = 1:m
    if(predicted{i} ~= actual{i})
        image = imread(test.Files{i});
        subplot(square_root, square_root, counter), imshow(image);
        counter = counter + 1;  
    end
    if(counter == max+1)
        break;
    end
end
     
end

