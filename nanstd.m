function [ S ] = nanstd( x )
% nanstd - Calculate biased standard deviation ignoring NaN values in x

    x_without_NaN = x(~isnan(x));
    S = std(x_without_NaN, 1);
end
