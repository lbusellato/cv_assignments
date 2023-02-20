%--------------------------------------------------------------------------
%
%   assignment4.m
%
%   This script implements the computation of epipolar lines. Given two
%   images ("left" and "right") and their perspective matrices Pl and Pr,the 
%   script plots in real time on the right image the epipolar line associated 
%   to the point in the left image currently under the mouse cursor. If the 
%   point is clicked, the epipolar line is permanently drawn onto the right 
%   image.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------

%% SETUP
clearvars;
close all;
clc;
addpath('../functions/');
% Load in the perspective matrices of the two images
Pl = load('perspective_matrix_left.mat').P;
Pr = load('perspective_matrix_right.mat').P;
% Load the images
imgleft = imread('left.jpg');
imgright = imread('right.jpg');

%% COMPUTATION OF THE EPIPOLES
disp('Coordinates of the epipoles:');
[el, er] = epipoles(Pl, Pr)

%% COMPUTATION OF THE FUNDAMENTAL MATRICES
disp('Fundamental matrices:');
Fl = fundamental(Pl, Pr, el);
Fr = fundamental(Pr, Pl, er);

%% EPIPOLAR LINES DRAWING
close all;
source = 0;
if source == 0
    left = figure(); title('Left image - click to draw epipolar lines in the right image');
    hold on; imshow(imgleft); hold on;
    right = figure(); title('Right image');
    hold on; imshow(imgright); hold on;
    F = Fl;
else
    right = figure(); title('Right image - click to draw epipolar lines in the left image');
    hold on; imshow(imgright); hold on;
    left = figure(); title('Left image');
    hold on; imshow(imgleft); hold on;
    F = Fr;
end
n = 10; % Number of epipolar lines to draw
for i = 1:n
    % Acquire the desired point
    if source == 0
        figure(left);
    else
        figure(right);
    end 
    hold on;
    [x,y] = ginput(1);
    plot(x,y,'+');
    % Compute the epipolar line
    if source == 0
        figure(right);
    else
        figure(left);
    end
    hold on;
    l = F*[x;y;1];
    x = 1:size(imgright,2);
    y = (-l(3, 1) - l(1, 1) * x) / l(2, 1);
    plot(x,y);
end

    % Acquire the current point
%     m = [ax.CurrentPoint(1,1), ax.CurrentPoint(1,2), 1];
%    
%     % Compute the epipolar line associated to the selected point
%     l = F * m.';
%     x = 1:n;
%     y = (-l(3, 1) - l(1, 1) * x) / l(2, 1);
