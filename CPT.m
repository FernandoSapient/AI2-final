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
    for k = 1:nVarargs
        X(:, k) = varargin{k};
        domains{k} = 'HML' + 0;
    end
    X(:, k+1) = y;
    domains{k+1} = 'HML' + 0;
    
    domain = combination(domains);
    cpt = [];
    for i = 1:(length(domain)/3)
        from = (i-1)*3 + 1;
        to = i * 3;
        cpt = cat(1, cpt, partial_pr(X, domain(from:to, :)));
    end
end

%% partial_pr
function P = partial_pr(X, domain)
    e = domain(1, :);
    [R, C] = size(X);
    matched = ones(R, 1);
    for c = 1:C-1
        matched = matched & (X(:, c) == e(c));
    end
    P = Pr(X(matched, :), domain);
end