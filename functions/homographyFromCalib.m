%--------------------------------------------------------------------------
%
%   homographyFromCalib.m
%
%   This function implements the computation of the homographies given the
%   perspective matrix related to the right image and the intrinsic camera 
%   parameters related to the left image. The function also returns the new
%   perspective matrices.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function [Hl, Hr, Pnl, Pnr] = homographyFromCalib(Pr, Kl)
    % Q-q factorization of the perspective matrices:
    Qr = Pr(:, 1:3);
    qr = Pr(:, 4);
    % Perspective matrix with world reference frame coincident with the left cameras'
    Pg = Kl * [eye(3) zeros(3, 1)];
    Ql = Pg(:, 1:3);
    ql = Pg(:, 4);
    % Optical centers of the two images
    Cl = -inv(Ql) * ql;
    Cr = -inv(Qr) * qr;
    % Computation of the R matrix
    r1 = ((Cr - Cl)/norm(Cr - Cl)).';
    % k is the original z axis
    k = [0 0 1];
    r2 = cross(k, r1);
    r3 = cross(r1, r2);
    R = [r1./norm(r1); r2./norm(r2); r3./norm(r3)];
    % Computation of the new perspective matrices
    Pnl = Kl * [R (-R * Cl)];
    Pnr = Kl * [R (-R * Cr)];
    % Q factors of the new perspective matrices
    Qnl = Pnl(:, 1:3);
    Qnr = Pnr(:, 1:3);
    % Computation of the homographies
    Hl = Qnl / Ql;
    Hr = Qnr / Qr;
end