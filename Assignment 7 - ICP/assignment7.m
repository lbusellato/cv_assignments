%--------------------------------------------------------------------------
%
%   assignment7.m
%
%   This script implements the computation of the rigid transformation that
%   aligns two sets of points representing the same scene from two
%   viewpoints, using the Iterative Closest Point (ICP) method.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------

%% SETUP
clearvars;
close all;
clc;
addpath('./Data/');
addpath('../functions/');
% For the subsampling
sample_rate = 3;
% Load the 'base' view
model = load('a4000007.cnn');
% Subsample to reduce the amount of points
i = randperm(size(model, 1));
i = i(1:round(size(model, 1)/sample_rate));
model = model(i,:);
% Load the view to be aligned
data = load('a4000001.cnn');
% Subsample to reduce the amount of points
i = randperm(size(data, 1));
i = i(1:round(size(data, 1)/sample_rate));
data = data(i,:);
% Plot the two clouds of points
figure();
plot3(model(:,1), model(:,2), model(:,3), '.b'); hold on;
plot3(data(:,1), data(:,2), data(:,3), '.r'); hold on; 
grid on; axis equal; title('Original views'); 

%% ICP
% Compute the rigid transformation that aligns the views
G = icp(model, data);
% Switch to homogeneous coordinates and apply the transformation
data = [data ones(size(data, 1), 1)]';
data = (G*data)';
% Plot the aligned views
figure();
plot3(model(:,1), model(:,2), model(:,3), '.b'); hold on;
plot3(data(:,1), data(:,2), data(:,3), '.r'); hold on; 
grid on; axis equal; title('Aligned views');
