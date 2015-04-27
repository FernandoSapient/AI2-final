function T = dependency_values(RowNames, RowVars, ColNames, ColVars, ColPrecedence)
%Computes the degree of depenency between each of the ROW variables and
%each of the COLUMN variables. The resulting table has the form
%           |    | C1 to R | R to C1 |  ...
%           | R1 |         |         |
%           | R2 |         |         |
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
%                       cause of the row variables. (C1_to_var before
%                       var_to_c1)If not provided, it is
%                       assumed true for all by default.
%
%   Outputs:
%       a table of doubles indicating the degree on which each variable
%       depends on each other, labelled. 
    assert(length(RowNames) == length(RowVars));
    assert(length(ColNames) == length(ColVars));
    assert(nargin<5 || length(ColNames) == length(ColPrecedence));
    
    %% Construct table
    VariableNames = repmat({'',''},size(ColNames));
    
    for(i=1:length(ColNames))
        j=(i-1)*2+1;
        if(nargin<5 || ColPrecedence(i))
            VariableNames(j)   = {cat( 2, char(ColNames(i)), '_to_var' )};
            VariableNames(j+1) = {cat( 2, 'var_to_', char(ColNames(i)) )};
        else
            VariableNames(j+1) = {cat( 2, char(ColNames(i)), '_to_var' )};
            VariableNames(j)   = {cat( 2, 'var_to_', char(ColNames(i)) )};
        end
    end
    
    T = array2table(zeros(length(RowNames),length(ColNames)*2),...
        'RowNames', RowNames, 'VariableNames', VariableNames);

    %% Fill table
    for(i=1:length(ColNames))
        j=(i-1)*2+1;
        for(k=1:length(RowNames))
            if(nargin<5 || ColPrecedence(i))
                [T(RowNames(k),VariableNames(j)), T(RowNames(k),VariableNames(j+1))] = cellified_deps(RowVars(k), ColVars(i));
            else
                [T(RowNames(k),VariableNames(j)), T(RowNames(k),VariableNames(j+1))] = cellified_deps(ColVars(i), RowVars(k));
            end
        end
    end
end


function [celledA, celledB] = cellified_deps(dependent, cause)
%Gets the dependency degrees from cell arrays and stores them in cells
    decelled_dep = cell2mat(dependent);
    decelled_cause = cell2mat(cause);
    valid = ~isnan(decelled_dep) & ~isnan(decelled_cause);
    try
        [a,b] = STE.dependency(decelled_dep(valid),decelled_cause(valid));
    catch
        a=NaN;
        b=NaN;
    end
    celledA = {a};
    celledB = {b};
end