%--------------------------------------------------------------------------
%
%   assignment1.m
%
%   This script showcases some examples of 3D point reprojection. The
%   prerequisite is the calibration of the camera using the Camera
%   Calibration Toolbox on the image set. 3D reprojection, with and without
%   radial distortion correction, is implemented, as well as the
%   reprojection of arbitrary 3D points, both as a simple coordinate shift
%   and as an animation of a ball bouncing on the calibration object.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------

%% SETUP
close all
clearvars
clc
addpath('./calib/')
addpath('../functions/')
% Load the calibration data obtained with Camera Calibration Toolbox
calib = load('calib/calib_data.mat');
camera = load('calib/Calib_Results.mat');
% Load the image (1-20)
img_no = 4; % Image number 4 showcases nicely both distortion correction and the animation
img = imread(strcat('calib/image',num2str(img_no),'.jpg'));
% 3D points to be reprojected (the corners of the chessboard):
X = calib.X_1;
% Intrinsic camera parameters
K = camera.KK;
% Extrinsic camera parameters
R = camera.(strcat('Rc_',num2str(img_no)));
T = camera.(strcat('Tc_',num2str(img_no))); 
% Distortion factors
kc = camera.kc;

%% 3D POINTS REPROJECTION W/ AND W/O RADIAL DISTORTION CORRECTION
x = proj(X, K, R, T);
% Plot the reprojected 3D points without radial distortion correction:
figure();
subplot(121); imshow(img); hold on;
plot(x(1, :), x(2, :), 'r+'); hold on; title('3D points reprojection without distortion correction');
% Apply radial distortion correction to improve the reprojection accuracy:
x = proj(X, K, R, T, kc);
subplot(122); imshow(img); hold on;
plot(x(1, :), x(2, :), 'g+'); hold on; title('3D points reprojection with distortion correction');

%% ARBITRARY 3D POINTS PROJECTION: COORDINATE SHIFT
% Shift the known 3D points of 1 square in each direction
X_shift = [X(1:2,:) + diag([calib.dX_1 calib.dY_1])*ones(2,size(X,2)); zeros(1,size(X,2))];
% Project the resulting coordinates
x_shift = proj(X_shift, K, R, T, kc);
figure(); imshow(img); title('Arbitrary 3D points reprojection: point shift'); hold on;
plot(x_shift(1,:), x_shift(2,:), 'b+');

%% ARBITRARY POINTS PROJECTION: ANIMATION
% Generate a bouncing ball trajectory
animation = bouncingTrajectory(0, 0, 0.3, 0.2, 0.1, 0);
% Project the animation trajectory
animationProj = proj([animation.X; animation.Y; animation.Z], K, R, T, kc);
animationFig = figure(); imshow(img); 
title('Arbitrary 3D points reprojection: animation (press any key to replay)'); hold on;
% Setup of a callback function to allow the replay of the animation
animationFig.WindowKeyPressFcn = {@play, animationProj, animation.dt};
hold on;
% This function handles the playback of the animation
global ball;
ball = plot(-10, -10, 'ro', 'MarkerFaceColor', 'r');
function play(~, ~, animationProj, dt)
    % Plot the ball trajectory
    global ball;
    for i = 1:size(animationProj, 2)
        pause(dt);
        set(ball, 'XData', animationProj(1, i), 'YData', animationProj(2, i));
    end
end
