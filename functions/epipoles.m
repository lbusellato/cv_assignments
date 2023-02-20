%--------------------------------------------------------------------------
%
%   epipoles.m
%
%   This function implements the computation of the epipoles given two
%   perspective matrices.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function [el, er] = epipoles(P1, P2)
    % Q-q factors of the perspective matrices
    Q1 = P1(:, 1:3);
    q1 = P1(:, 4);
    Q2 = P2(:, 1:3);
    q2 = P2(:, 4);
    % Computation of the epipoles
    el = -(Q2 / Q1) * q1 + q2;
    el = el./norm(el);
    er = -(Q1 / Q2) * q2 + q1;
    er = er./norm(er);    
end