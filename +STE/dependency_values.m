function T = dependency_values(RowNames, RowVars, ColNames, ColVars, ColPrecedence)
%Computes the degree of depenency between each of the ROW variables and
%each of the COLUMN variables. The resulting table has the form
%           |    | C1 from R | R from C1 |  ...
%           | R1 |           |           |
%           | R2 |           |           |
%             ?
%   Inputs:
%       RowNames -  Cell array containing the names of the row variables
%                   Each cell must contain a string
%       RowVars  -  Cell array containing the variables themselves. Each
%                   cell must contain a column vector
%       ColNames -  Cell array containing the names of the row variables
%                   Each cell must contain a string
%       ColVars  -  Cell array containing the variables themselves. Each
%                   cell must contain a column vector
%   ALL VECTORS MUST BE THE SAME SIZE
%       ColPrecedence - an array of logicals the length of ColNames
%                       indicating, for each, whether they should be the
%                       cause of the row variables. If not provided, it is
%                       assumed true for all by default.
%
%   Outputs:
%       a table of doubles indicating the degree on which each variable
%       depends on each other, labelled. 
    assert(size(RowNames) == size(RowVars));
    assert(size(ColNames) == size(ColVars));
    assert(size(ColNames) == size(ColPrecedence));
    
    repmat(['';'_to_var'],size(ColNames));
    repmat(['var_to_';''],size(ColNames));
    
    
    VariableNames = cat(
    
    T = array2table(zeros(length(RowNames),length(ColNames),...
        'RowNames', RowNames, 'VariableNames', VariableNames)


end

