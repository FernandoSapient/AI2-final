function [d_y_from_x, d_x_from_y]= dependency( y, x )
%Computes the degree of DEPENDENCY that y has on x 
%   Inputs:
%       Y - column vector of values of a variable believed to be caused by X
%       X - column vector of values of a variable believed to be the cause
%           of Y
%   Outputs:
%       d_y_from_x - the degree on which y depends on x
%       d_x_from_y - the degree on which x depends on y
    d_y_from_x = 1-abs(STEYXY(y,x))/mean(y);
    d_x_from_y = 1-abs(STEYXY(x,y))/mean(x);
end

