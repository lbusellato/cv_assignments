%--------------------------------------------------------------------------
%
%   homography.m
%
%   This function implements the computation of the homographies given two
%   set of corresponding points in two images.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function H = homography(p1, p2)
    n = size(p1,2);
    A = zeros(2 * n, 9);
    for i = 1:n
        % Homogeneous coordinates of the acquired points
        mi1 = [p1(:, i); 1]';
        mi2 = [p2(:, i); 1];
        % Cross product matrix of mi2
        mi2x = [   0     -mi2(3) mi2(2);
                 mi2(3)     0   -mi2(1);
                -mi2(2)   mi2(1)   0];
        % Kronecker product
        kro = kron(mi1, mi2x);
        % The first two linearly independent lines of kro go into A
        A((2*i-1):(2*i), :) = kro(1:2, :);
    end
    % Solving the linear problem Avec(h) = 0 with SVD
    [~, ~, V] = svd(A);
    % Constructing the homography
    H = reshape(V(:,end), 3, 3);
    H = H./H(3, 3);
end