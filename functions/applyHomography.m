%--------------------------------------------------------------------------
%
%   applyHomography.m
%
%   This function applies a given homography to a set of 2D points.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function pout = applyHomography(pin, H)
    pout = H*pin;
    pout = pout(:,:)./pout(3,:);
end