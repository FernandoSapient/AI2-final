function [ cpt ] = CPT( y, varargin )
% CPT - learn conditional probability from the data
%
% Dependencies: [combination.m, Pr.m]
%   
% Assume: 
%   all variables have the same domain = ['H', 'M', 'L']
%   

    nVarargs = length(varargin);
    rows = length(y);
    X = zeros(rows, nVarargs+1);
    
    domains = cell(1, nVarargs + 1);
    domains{1} = 'HML' + 0;
    
    X(:, 1) = y;
    for k = 1:nVarargs
        X(:, k+1) = varargin{k};
        domains{k+1} = 'HML' + 0;
    end
    
    domain = combination(domains);
    cpt = Pr(X, domain);
end

%% 