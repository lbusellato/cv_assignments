%--------------------------------------------------------------------------
%
%   proj.m
%
%   This function implements the projection of a set of 3D points to a 2D
%   plane using a supplied full perspective matrix or the intrinsic/extrinsic
%   camera parameters obtained with calibration. The function handles
%   coordinates supplied in non-homogeneous form, of any shape (at least 4x3).
%   If kc vector is supplied, the tangential and radial distortion equations 
%   (https://web.archive.org/web/20220216122458/http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/parameters.html)
%   are applied to the projected points.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function p2D = proj(p3D, P, R, T, kc)
    % Fix the shape so that each column corresponds to a point
    if size(p3D, 1) > size(p3D, 2)
        p3D = p3D';
    end
    % Convert to homogeneous coordinates, either by adding ones or normalizing
    if size(p3D, 1) == 3
        p3D = [p3D; ones(1,size(p3D,2))];
    elseif ~isequal(p3D(4,:),ones(1,size(p3D,2)))
        p3D = p3D(:,:)./p3D(4,:);
    end
    if nargin > 3 % P needs to be computed, the supplied P is actually K
        K = P;
        P = K*[eye(3) zeros(3, 1)]*[R T; 0 0 0 1];
    end
    % Carry out the projection
    p2D = P*p3D;
    % Convert to homogeneous coordinates
    p2D = p2D(:,:)./p2D(3,:);
    if nargin == 5 % Distortion correction is requested
        Y = R*p3D(1:3,:) + T;
        xn = Y(:,:)./Y(3,:);
        % Applying distortion correction
        r = xn(1, :).^2 + xn(2, :).^2; %NB: r is r^2
        dx = [
            2 * kc(3) * xn(1, :).*xn(2, :) + kc(4).*(r + 2 * xn(1, :).^2);
            kc(3) * (r + 2 * xn(2, :).^2) + 2 * kc(4) * xn(1, :).*xn(2, :)
            ];
        xd = [
            (1 + kc(1) * r + kc(2) * r.^2 + kc(5) * r.^3).*xn(1, :) + dx(1, :);
            (1 + kc(1) * r + kc(2) * r.^2 + kc(5) * r.^3).*xn(2, :) + dx(2, :)
            ];
        p2D = [
            round(K(1, 1) * xd(1, :) + K(1, 2) * xd(2, :) + K(1, 3));
            round(K(2, 2) * xd(2, :) + K(2, 3))
            ];
    end
end