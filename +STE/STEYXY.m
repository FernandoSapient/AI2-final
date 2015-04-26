% Copyright (c) 2014, Ahmos Sansom
% All rights reserved.
% Source: http://www.mathworks.com/matlabcentral/fileexchange/48070-monte-carlo-example-of-a-multi-commodity-spot-and-forward-curves-simulator/content/STEYXY.m
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.

function result = STEYXY(yValues, xValues)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % This function determines the standard error based on the excel
    % function STEYX
    %
    %   Inputs:
    %
    %   yValues  - known y values
    %                 
    %   xValues  - known x values 
    %
    %   Outputs:    
    %
    %   result   - standard error 
    %
    % Ahmos Sansom - April 2014
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Get size of inputs
    nx =  size(xValues,1);
    ny =  size(yValues,1);   
    
    % some checks
    assert(nx == ny,'Number of elements in dataset must be equal');    
    assert(nx > 3, 'Number of element must be greater than 3');
    
    % get mean of arrays and initialise temp sum
    xbar = mean(xValues);
    ybar = mean(yValues);
    tmpSum1 = 0.0;
    tmpSum2 = 0.0;
    tmpSum3 = 0.0;
    
    for i=1:nx
        tmpSum1 = tmpSum1 + (xValues(i) - xbar) * (yValues(i) - ybar);
        tmpSum2 = tmpSum2 +  (yValues(i) - ybar) * (yValues(i) - ybar);
        tmpSum3 = tmpSum3 + (xValues(i) - xbar) * (xValues(i) - xbar);
    end
    
    % intermediate step
    tmpSum1 = tmpSum1*tmpSum1/tmpSum3;
            
    result = sqrt( (tmpSum2 - tmpSum1) / (nx - 2));
    
end