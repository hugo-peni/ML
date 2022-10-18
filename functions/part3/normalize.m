function [X, param1, param2] = normalize(data, normalization, param1, param2)
%NORMALIZE Normalize the data wrt to the normalization technique passed in
%parameter. If param1 and param2 are given, use them during the
%normalization step
%
%   input -----------------------------------------------------------------
%   
%       o data : (N x M), a dataset of M sample points of N features
%       o normalization : String indicating which normalization technique
%                         to use among minmax, zscore and none
%       o param1 : (optional) first parameter of the normalization to be
%                  used instead of being recalculated if provided
%       o param2 : (optional) second parameter of the normalization to be
%                  used instead of being recalculated if provided
%
%   output ----------------------------------------------------------------
%
%       o X : (N x M), normalized data
%       o param1 : first parameter of the normalization
%       o param2 : second parameter of the normalization

switch normalization 
    case 'minmax'
        if nargin == 2
            param1 = min(data, [], 2);
            param2 = max(data, [], 2);
        end
        X = (data - param1)./repmat((param2 - param1), 1, size(data, 2));
    case 'zscore'
        if nargin == 2
            param1 = mean(data, 2);
            param2 = std(data, 0, 2);
        end
        X = (data - param1)./repmat(param2, 1, size(data, 2));
    case 'none'
        param1 = 0; 
        param2 = 0;
        X = data;
    otherwise
        printf("minmax, zscore or none required for the normalization");
end
end

