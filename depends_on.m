function out = depends_on( y, x, threshold )
%DEPENDS_ON returns whether y depends on x
%   Inputs:
%       Y - column vector of values of a variable believed to be caused by X
%       X - column vector of values of a variable believed to be the cause
%           of Y
%       threshold - value at which the possibility is discarded. This value
%                   is taken as proportional to the means of y. I.e.: if
%                   the threshold is 0.5 and the dependency analysis
%                   returns that Y depending on x would cause an error >0.5
%                   times the means, the function immediately returns
%                   false.
%   Outputs:
%       TRUE or FALSE
    [d_y_x, d_x_y] = dependency(y,x);
    if(nargin >=3 && d_y_x<threshold)
        out = false;
    else
        out = d_y_x > d_x_y;
    end
end

