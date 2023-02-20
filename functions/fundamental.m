%--------------------------------------------------------------------------
%
%   fundamental.m
%
%   This function implements the computation of the fundamental matrix
%   given two perspective matrices and the epipole related to one of them.
%   P1 should be the perspective matrices associated to the image e1 was
%   calculated for.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function F = fundamental(P1, P2, e1)
    % Q factors of the perspective matrices
    Q1 = P1(:, 1:3);
    Q2 = P2(:, 1:3);
    % Cross product matrix of the epipole
    ex = [0, -e1(3), e1(2);
        e1(3), 0, -e1(1);
        -e1(2), e1(1), 0
        ];
    % Computation of the fundamental matrix
    F = (ex * (Q2 / Q1));
    F = F./norm(F);
end