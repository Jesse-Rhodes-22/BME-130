clear all;
close all;
clc;

%a
figure1 = figure;
load MRI;
[r c] = size(I);
ax(1) = subplot(2,2,1);
pcolor(I);
shading interp;
colormap(bone);
title('Original Image');

%b
ax(2) = subplot(2,2,2);
I_1 = 1 - I;
pcolor(I_1);
shading interp;
colormap(bone);
title('Reversed Color Image');

%c
ax(3) = subplot(2,2,3);
I_1 = I.^0.5;
pcolor(I_1);
shading interp;
colormap(bone);
title('Nonlinear Transform Image');

%d
I_thresh = zeros(size(I));  % Initialize the new image
I_thresh(I < 0.3) = 0;         % Set pixels < 0.3 to black
I_thresh(I >= 0.3 & I <= 0.5) = 0.5; % Set pixels between 0.3 and 0.5 to gray
I_thresh(I > 0.5) = 1;        % Set pixels > 0.5 to white
ax(4) = subplot(2, 2, 4);
pcolor(I_thresh);
shading interp;
colormap(bone);
title('Dual Thresholded Image');

%e
figure;
pcolor(I);
shading interp;
colormap(hsv);
title('With HSV Colormap');
%we can easily change the colormap using matlab's colormap function.