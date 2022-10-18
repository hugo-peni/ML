function [rimg] = reconstruct_image(cimg, ApList, muList)
%RECONSTRUCT_IMAGE Reconstruct the image given the compressed image, the
%projection matrices and mean vectors of each channels
%
%   input -----------------------------------------------------------------
%   
%       o cimg : The compressed image
%       o ApList : List of projection matrices for each independent
%       channels
%       o muList : List of mean vectors for each independent channels
%
%   output ----------------------------------------------------------------
%
%       o rimg : The reconstructed image

%% get the size of the image
height = size(ApList,2);
width = size(cimg, 2);

%% create a host vector
rimg = zeros(height, width, 3);

%% iteration to compute the reconstructed image for each colors
for i = 1:3
    rimg(:, :, i) = reconstruct_pca(cimg(:, :, i), ApList(:, :, i), muList(:, i));
end

end

