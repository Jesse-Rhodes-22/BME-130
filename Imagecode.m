% Example to apply some mathematical and threshold operations to an MR image of the brain.  
clc; close all; clear all; 
load brain;         			% Load image   
subplot(2,2,1);			% Display the images 2 by 2
pcolor(I);           			% Display original image 
shading interp;      		% Use interpolation 
colormap(bone);      		% Grayscale color map
caxis([0 1]);        		% Fix pcolor scale
title('Orignal Image','FontSize',12);
%
subplot(2,2,2);
I_1 = I + 0.3;			% Brighten the image by adding 0.3	
pcolor(I_1);           			% Display original image 
shading interp;      		% Use interpolation 
colormap(bone);      		% Grayscale color map
caxis([0 1]);        		% Fix pcolor scale
title('Lightened','FontSize',12);
%
subplot(2,2,3);
I_2 = 1.75*I;			% Increase image contrast by multiplying by 1.75
pcolor(I_2);           			% Display original image 
shading interp;      		% Use interpolation 
colormap(bone);      		% Grayscale color map
caxis([0 1]);        		% Fix pcolor scaletitle('Lightened','FontSize',12);
title('Contrast enhanced','FontSize',12);

subplot(2,2,4);
[r,c]=size(I); %Get image dimensions
thresh = 0.25;			% Set threshold
for k = 1:r
    for j = 1:c
        if I(k,j) < thresh 		% Test each pixel separately
            I_3(k,j) = 1;		% If low make corresponding pixel white (1)	
        else 	
            I_3(k,j) = 0;		% Otherwise make it black (0) 
        end
    end
end
pcolor(I_3);           			% Display original image 
shading interp;      		% Use interpolation 
colormap(bone);      		% Grayscale color map
caxis([0 1]);        		% Fix pcolor scale
title('Thresholded','FontSize',12);
