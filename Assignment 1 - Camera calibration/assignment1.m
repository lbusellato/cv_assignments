%--------------------------------------------------------------------------
%
%   assignment1.m
%
%   This script implements the direct method for camera calibration. The
%   full perspective matrix is computed from the known correspondences
%   between 3D points of a calibration object and their projection on the
%   image. The perspective matrix is then used to reproject the 3D points
%   on the image itself, proving its accuracy.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------

%% SETUP
clearvars
close all
clc
addpath('../functions/');
% Load the image of the calibration object:
calib = imread(strcat('img2.jpg'));
% Homogeneous coordinates of the 3d calibration points
Mi =    [
    0, 0, 0, 1;
    61, 0, 0, 1;
    61, 61, 0, 1;
    0, 0, 55, 1;
    61, 0, 55, 1;
    61, 61, 55, 1;
    ]'; 
% Show the image
figure(); imshow(calib); hold on;

%% MANUAL CALIBRATION POINTS INPUT
% For the order, see calibration_points_order.jpg
title("Pick the calibration points."); 
mi = zeros(6,3);
for i = 1:6
    % Collect the homogeneous coordinates of the 2D calibration points:  
    [x,y] = ginput(1);
    mi(i,:) = [x,y,1];
    scatter(x, y, 'g+');
    text(x, y, strcat('.       ',num2str(i)));
end

%% FULL PERSPECTIVE MATRIX COMPUTATION
% Construction of the perspective matrix
disp('Computed full perspective matrix:');
P = perspectiveMatrix(mi, Mi)
% Save the  perspective matrix
save('perspective_matrix', 'P');

%% 3D POINTS REPROJECTION
p2D = proj(Mi, P);
scatter(p2D(1,:), p2D(2,:), 'r');   
title("3D homogeneous points reprojected with the computed perspective matrix")