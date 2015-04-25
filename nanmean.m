function [ m ] = nanmean( x )
% nanmean - Calculate mean ignoring NaN values in x

    x_without_NaN = x(~isnan(x));
    m = mean(x_without_NaN);
end