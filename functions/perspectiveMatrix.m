%--------------------------------------------------------------------------
%
%   perspectiveMatrix.m
%
%   This function implements the computation of the full perspective
%   matrix given a set of 3D points and the corresponding 2D points on an
%   image. Both sets must have at least 6 points in them. The function
%   handles the reshaping and conversion to homogeneous coordinates.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function P = perspectiveMatrix(p2D, p3D)
    % Fix the shape so that each column corresponds to a point
    if size(p3D, 1) > size(p3D, 2)
        p3D = p3D';
    end
    if size(p2D, 1) > size(p2D, 2)
        p2D = p2D';
    end
    if size(p3D, 2) < 6 || size(p2D, 2) < 6
        error('perspectiveMatrix.m requires at least 6 points');
    end
    % Convert to homogeneous coordinates, either by adding ones or normalizing
    if size(p3D, 1) == 3
        p3D = [p3D ones(1,size(p3D,2))];
    elseif ~isequal(p3D(4,:),ones(1,size(p3D,2)))
        p3D = p3D(:,:)./p3D(4,:);
    end
    if size(p2D, 1) == 2
        p2D = [p2D ones(1,size(p2D,2))];
    elseif ~isequal(p2D(3,:),ones(1,size(p2D,2)))
        p2D = p2D(:,:)./p2D(3,:);
    end
    % A matrix construction
    A = zeros(12);
    for i = 1:6
        a = p2D(:,i);
        ax = [0 -a(3) a(2);
             a(3) 0 -a(1);
             -a(2) a(1) 0];
        % Kronecker product of the skew symmetric matrix of mi and Mi
        kro = kron(ax, p3D(:,i));
        % Construction of the A matrix
        A(2*i-1,:) = kro(:,1);
        A(2*i,:) = kro(:,2);
    end
    % Solution of the linear homogeneous system A*vec(p) = 0 with SVD
    [U,S,V] = svd(A);
    vecP = V(:,size(A,2));
    % Construction of the perspective matrix
    P = reshape(vecP, 4, 3)';
end