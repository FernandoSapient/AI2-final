function indicator_values = get_region(all_data, index, lookup_value)
%Gets the values of the given indicator for the given country for all the
%M years that the variable spans
%   Inputs:
%       ALL_DATA     - An L*N by M matrix containing all the values of the
%                      desired country, where L is the number of regions, N
%                      is the number of years,
%                      and M is the number of indicators.
%       INDEX        - A vector containing, for each of the L*N rows
%                      the region that it corresponds to.
%       LOOKUP_VALUE - The value to find in INDEX, and for which the
%                      INDICATOR_VALUES are desired.
%   
%   Outputs:
%      INDICATOR_VALUES - A vector with M columns containing, in each I-th
%                         position, the value of INDICATOR for the I-th
%                         year
    [n,m]=size(index);
    padded_name = sprintf(['%-', num2str(m),'s'], lookup_value);    %all rows in a matrix must have the same number of columns. Matlab achieves this with spaces on the right. We must do the same with our query
    comparison_name = repmat(padded_name,n,1);
    matching_chars = index == comparison_name;
    matching_rows = all(matching_chars,2);
    indicator_values = all_data(matching_rows, :);
end

