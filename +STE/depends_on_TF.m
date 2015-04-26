function out = depends_on_TF( d_y_x, d_x_y, threshold, minimum )
%DEPENDS_ON_TF returns TRUE or FALSE, making the decision on whether the
%degrees are different enough that dependency should be considered. If
%either degree is NAN, the function immediately returns FALSE.
%   Inputs:
%       d_y_x - degreee of depenency of the variable Y on the variable X
%       d_x_y - degreee of depenency of the variable Y on the variable X
%       threshold - Difference below which the possibility is accepted. 
%                   This value is taken as proportional to the means of y.
%                   E.g.: if the threshold is 0.1 and the dependency analysis
%                   returns that Y depending on X would cause an error of
%                   .3 times the mean (STE dependency of 70%), while X
%                   depending on Y would cause an error of .1
%                   (STE dependency of 90%), the function returns false
%                   because the difference is greater than .1. However, if
%                   the error of X dependin on Y would be of .25 (STE
%                   dependency of 75%) the function returns true _even
%                   though_ the dependency of X on Y is greater than Y on
%                   X. In short, the threshold is the range in which the
%                   values are considered to be "close enough".
%                   If no threshold is specified, hard inequality (strictly
%                   less than) is enforced.
%       minimum   - value at which the possibility is discarded. This value
%                   is taken as proportional to the means of y. I.e.: if
%                   the minimum is 0.5 and the dependency analysis
%                   returns that Y depending on x would cause an error >0.5
%                   times the means, the function immediately returns
%                   false.
%   Outputs:
%       TRUE or FALSE
    if(~isnan(d_y_x) && ~isnan(d_x_y))
        if(nargin >=4 && d_y_x<minimum)
            out = false;
        else
            if(d_y_x > d_x_y)
               out = true;
            else
                if(nargin < 3)
                    out = false;
                else
                    out = (abs(d_y_x - d_x_y) < threshold);
                end
            end
        end
    else
        out = false;
    end
end

