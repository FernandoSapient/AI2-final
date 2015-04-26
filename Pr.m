function [ p ] = Pr( x, d )
% pr - Probability distribution of x given its domain
%   
% Input:
%   x - random variable. 
%   d - domains of 'x'.
%
% Note:
%   x and d are column vector

    [x_count, dimension] = size(x);
    d_size = size(d, 1);
    k = get_laplace_k;
    
    p = zeros(1, d_size);
    for i=1:d_size
        x_is_d = (x == ones(x_count, 1) * d(i, :));
        x_is_d_count = sum(sum(x_is_d, 2) == dimension);
        p(i) = (x_is_d_count + k) / (x_count + k * d_size);
    end
end