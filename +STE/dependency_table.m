function T = dependency_table( V )
%Computes whether a set of variables can be considered to depend on another
%as given by their dependency values.
%   Inputs:
%       V - Table of dependency values. Each row is one of the variables
%       	to determine, while each pair of columns represents one of the 
%       	variables with which a dependency relation could exists. Each
%       	pair of columns is taken to be ordered as the value for the
%       	desired relation first, then the alternative dependency. For
%       	example, to see if A depends on any of the variables in a set B
%           and B depends on c, the table
%       	would have to be in the following form:
%           |    | a from b | b from a | b from c | c from b |
%           | b1 |          |          |          |          |
%           | b2 |          |          |          |          |
    [n,m] = size(V);
    T = array2table(true(n,m/2), 'RowNames', V.Properties.RowNames, ...
        'VariableNames', V.Properties.VariableNames([1:2:m]) );
    

end

