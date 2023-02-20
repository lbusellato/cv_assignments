%--------------------------------------------------------------------------
%
%   assignment6.m
%
%   This script implements the computation of the homography that aligns two 
%   stereo images. The homography is uded to produce a mosaic of two
%   images.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------

%% SETUP
clearvars;
close all;
clc;
addpath('../functions/');
% Load in the images
img1 = rgb2gray(imread('./img1.jpg'));
img2 = rgb2gray(imread('./img2.jpg'));
n = 10; % Number of points to acquire

%% MANUAL POINT ACQUISITION
% Set up the figures
fig1 = figure();
title('Pick a point');
hold on;
imshow(img1);
fig2 = figure();
title('Pick the corresponding point');
hold on;
imshow(img2);
p1 = zeros(2, n);
p2 = zeros(2, n);
for i = 1:n
    figure(fig1);
    hold on;
    [x, y] = ginput(1);
    p1(:, i) = [x; y];
    plot(x, y, 'g*');
    figure(fig2);
    hold on;
    [x, y] = ginput(1);
    p2(:, i) = [x; y];
    plot(x, y, 'r*');
end

%% PRE-PICKED POINTS
% Use these to skip the manual acquisition of the corresponding points,
% since it takes some time and the points need to be picked with some
% precision to obtain a good mosaic. 
p1 =   [418.3002  766.5633  780.4591  385.2978  498.2010  792.6179  442.6179  502.5434  327.9777  783.0645;
   95.0993  208.8710  365.1985  362.5931  398.2010  477.2333  245.3474  256.6377  359.9876   63.8337];
p2 =   [125.6203  469.5409  481.6998   90.0124  222.8908  489.5161  155.1489  224.6278   13.5856  479.0943;
   58.6228  208.8710  346.0918  359.9876  390.3846  443.3623  227.1092  245.3474  359.1191   82.0720];

%% COMPUTATION OF THE HOMOGRAPHY
H = homography(p1, p2);

%% IMAGE WARPING AND MOSAICING
mosaic = mosaicing(img1, img2, H);
% Show the mosaicing
figure(); title("Mosaicing of the images"); hold on;
imshow(uint8(mosaic));