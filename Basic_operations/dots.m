
function [dotPattern] = dots(height,width,percentageWhite)

dotPattern = zeros(height, width);

% Set the desired percentage of the elements in dotPattern to 1
dotPattern(1:round(0.01*percentageWhite*numel(dotPattern))) = 1;

% Seed the random number generator
rand('twister',100*sum(clock));

% Randomly permute the element order
dotPattern = reshape(dotPattern(randperm(numel(dotPattern))), height, width);
dotPattern = mat2gray(dotPattern);
