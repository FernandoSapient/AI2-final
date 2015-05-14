function [ factors ] = make_factors( e, domains, bn, factors )
% make_factor - make joint factors
%
% input:
%       - e, the evidences
%       - domains, the domains of all variables
%       - bn, the bayesian nets
%       - factors, the initial joint factors

% Assume domain = ['H', 'M', 'L']' for all discretized variables;
domain = ['H' 'M' 'L']' + 0;

[~, D] = size(e);
for d = 1:D
    column = domains(:, end-d+1);
    for value = 'HML' + 0
        factor = factors(column == value, :) * bn.cpts{d}(domain == value);
        factors(column == value, :) = factor;
    end
end

