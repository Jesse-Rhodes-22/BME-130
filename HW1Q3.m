clear all
close all
clc

%a)
load('MRI.mat');
figure;
subplot(2, 2, 1);
imshow(I, []);
title('Original MRI Image');

%b)
reversedImage = 255 - I;
subplot(2, 2, 2);
imshow(reversedImage, []);
title('Reversed Color MRI Image');

%c)
nonlinear = sqrt(double(I));
subplot(2,2,3);
imshow(nonlinear, []);
title('Nonlinear Transform');
