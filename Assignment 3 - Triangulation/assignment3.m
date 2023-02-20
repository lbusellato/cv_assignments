%--------------------------------------------------------------------------
%
%   assignment3.m
%
%   This script implements the linear-eigen method for triangulation. Given
%   a set of pairs of 2D corresponding points on two images, the method
%   computes the associated set of 3D points. The accuracy of the method is
%   showcased by computing the Euclidean distance between the computed 3D
%   points.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------

%% SETUP
clearvars;
close all;
clc;
addpath('../functions/');
% Load the perspective matrices obtained with the direct calibration method
P(:, :, 1) = load('perspective_matrix_1.mat').P;
P(:, :, 2) = load('perspective_matrix_2.mat').P;
% Load the images
img1 = imread('image1.jpg');
img2 = imread('image2.jpg');
% Set up the figures that show the images
fig1 = figure();
imshow(img1);
title('Select two points on the image');
drawnow;
fig2 = figure();
imshow(img2);
title('Select the two corresponding points on the image')
drawnow;
fig3 = figure();
imshow(img1);
title('Computed euclidean distance')
drawnow;
fig = [fig1, fig2, fig3];

%% 2D POINTS ACQUISITION
m = zeros(2, 2, 2);
for i = 0:1
    % Acquire two points from each image
    figure(fig(i + 1));
    hold on;
    for j = 1:2
        [x,y] = ginput(1);
        m(:, j, i + 1) = [x, y].';
        scatter(x, y, 'g', '+');
        text(x, y, strcat('.       ',num2str(j)));
    end
    plot(m(1, :, i + 1), m(2, :, i + 1), 'g');
end

%% 3D POINTS COMPUTATION
M = zeros(3, 2);
% Compute the 3D points corresponding to the selected 2D points
for i = 1:2
    A = zeros(4, 4);
    for j = 1:2
        % Normalize the perspective matrix
        P(:, :, j) = P(:, :, j)./norm(P(3, 1:3, j));
        A(2 * j - 1, :) = P(1, :, j) - m(1, i, j) * P(3, :, j);
        A(2 * j, :) = P(2, :, j) - m(2, i, j) * P(3, :, j);
    end
    % Solve the system using SVD
    [~, ~, V] = svd(A);
    v = V(:,end);
    M(:, i) = v(1:3)./v(4);
end

%% EUCLIDEAN DISTANCE BETWEEN THE COMPUTED POINTS
d = norm(M(:,1)-M(:,2));
% Show the computed euclidean distance on the first image
figure(fig(3));
hold on;
scatter(m(1, :, 1), m(2, :, 1), 'g', '*');
plot(m(1, :, 1), m(2, :, 1), 'g');
text(m(1,1,1),m(2,1,1),num2str(d),'FontSize',16,'Color','r');