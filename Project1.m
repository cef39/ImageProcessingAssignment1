
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 1.1
open Mask.m

roseImage = imread('rose1024.tif');

% get dimensions of image
[roseM, roseN] = size(roseImage);

% want to create mask that is half the size of the image
maskM = roseM / 2;
maskN = roseN / 2;

% since maskM and maskN are half of the image, these coordinates should be
% the center of the image. 

% Subtract half of the masks height and width from the center in order to
% find the upper left coordinates.
rUL = maskM - maskM / 2;
cUL = maskN - maskN / 2;

% Add half of the masks height and width from the center in order to find
% the lower right coordinates
rLR = maskM + maskM / 2;
cLR = maskN + maskN / 2;

%generate mask of MxN with rectangle of 1's being M/2xN/2 and centered
m = Mask(roseM, roseN, rUL, cUL, rLR, cLR);

% scalar multiply bitmask with roseImage to apply mask
roseResult = roseImage.* uint8(m);

% show rose image with bitmask applied
imshow(roseResult)
title('rose with bitmask applied')
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 1.2
open imArithmetic.m

liveImage = double(imread('angiography_live_ image.tif'));
maskImage = double(imread('angiography_mask_image.tif'));

g = uint8(imArithmetic(liveImage, maskImage, 'subtract'));

imshow(g)
title('subtraction of mask from live')
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 1.3

open imageHist.m
roseImage2 = imread('rose1024.tif');

% normalized histogram
hn = imageHist(roseImage2, 'n');

% unnormalized histogram
hu = imageHist(roseImage2, 'u');

histogram(hn)
title('normalized histogram for rose')
pause
histogram(hu)
title('unnormalized histogram for rose')
pause

open meanVariance.m
[mean, variance] = meanVariance(roseImage2)

liveImage2 = imread('angiography_live_ image.tif');
% normalized histogram
hn2 = imageHist(liveImage2, 'n');

% unnormalized histogram
hu2 = imageHist(liveImage2, 'u');


histogram(hn2)
title('normalized histogram for live angiography')
pause
histogram(hu2)
title('unnormalized histogram for live angiography')
pause

open meanVariance.m
[mean2, variance2] = meanVariance(liveImage2)

open histEqual.m
roseEqual = histEqual(roseImage2);
liveEqual = histEqual(liveImage2);

roseEqual2 = histeq(roseImage2);
imshow(roseEqual2)
pause

liveEqual2 = histeq(liveImage2);
imshow(liveEqual2)
pause

imshow(roseEqual)
title('rose with hist equalization')
pause
imshow(liveEqual)
title('live image with hist equalization')
pause



