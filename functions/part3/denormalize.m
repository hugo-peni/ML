function [Xinversed] = denormalize(X, param1, param2, normalization)
%DENORMALIZE Denormalize the data wrt to the normalization technique passed in
%parameter and param1 and param2 calculated during the normalization step
%normalization step
%
%   input -----------------------------------------------------------------
%   
%       o X : (N x M), normalized data of M sample points of N features
%       o normalization : String indicating which normalization technique
%                         to use among minmax, zscore and none
%       o param1 : first parameter of the normalization 
%       o param2 : second parameter of the normalization
%
%   output ----------------------------------------------------------------
%
%       o Xinversed : (N x M), the denormalized data

switch normalization 
    case 'minmax'
        Xinversed = X.*repmat((param2 - param1), 1, size(X, 2)) + param1;
    case 'zscore'
        Xinversed = X.*repmat(param2, 1, size(X, 2)) + param1;
    otherwise
        Xinversed = X;
end
end

