load data.mat;



YEARS = [1:11]';
HBCU_CS = [1563; 1409; 1182; 969; 723; 719; 716; 711; 694; 693; 704];
HBCU_SE = [8898, 8765, 8598, 8562, 8393, 8374, 8343, 8845, 8845, 8793, 8877]';
HBCU_NON_SE = [17590, 17678, 18015, 18074, 18727, 18623, 18536, 18825, 20093, 19465, 18981]';

figure;
plot(YEARS, HBCU_CS, '*'); hold on
plot(YEARS,HBCU_SE, "r*");
model = fitlm(YEARS,HBCU_CS,'quadratic');

predict1 = predict(model, 17);
disp(predict1);

