function [ sigma ] = nanstd( x )
% nanstd - Calculate biased standard deviation ignoring NaN values in x

    x_without_NaN = x(~isnan(x));
    sigma = std(x_without_NaN, 1);
end
