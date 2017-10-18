function [ m ] = Mask( M, N, rUL, cUL, rLR, cLR )
%Mask Generates MxN Mask
% MxN = rows x columns
%   Generates MxN mask with 1's in the rectangle defined by upper-right
%   coordinates (rUL, cUL) and lower-right coordinates (rLR, cLR).

% check to see if upper left coordinates are  within MxN
if (rUL < 1 || cUL < 1)
    disp("rUL and cUL cannot be less than row 1 or column 1")
    return;
% check to see if lower right coordinates are within MxN
elseif (rLR > M || cLR > N)
    disp("rLR cannot exceed M and cLR cannot exceen N")
    return;
end

% generate MxN matrix
m = zeros(M, N);

% find MxN dimensions for rectangle of 1's
rectM = rLR - rUL + 1;
rectN = cLR - cUL + 1;

% generate MxN matrix for rectanle of 1's
mask = ones(rectM, rectN);

% change mask to have 1's in rectangle specified by coordinates
m(rUL:rLR, cUL:cLR) = mask;

end

