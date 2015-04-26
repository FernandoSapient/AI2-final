function [ theta ] = mle( x )
% MLE - Maximum likelihood estimator
%   Learn parameters (mean and variance) for a 1-D Gaussian dataset
%
% Input:
%   x - 1-D Gaussian data sample of the random variable
%
% Output:
%   theta - parameters of the distritution over x
%

    theta = [ nanmean(x) nanstd(x)^2 ];
end

