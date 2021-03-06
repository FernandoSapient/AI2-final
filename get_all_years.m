function indicator_values = get_all_years(region_data, lookup, lookup_value)
%Gets the values of the given indicator for the given country for all the
%M years that the variable spans
%   Inputs:
%       REGION_DATA  - An N by M matrix containing all the values of the
%                      desired country, where n is the number of years
%                      and M is the number of indicators. Indicators must 
%                      be ordered as stated in LOOKUP
%       LOOKUP       - An index vector with M rows containing the 
%                      indicators that each row in INDICATOR corresponds
%                      to.
%       LOOKUP_VALUE - The value to find in LOOKUP, and for which the
%                      INDICATOR_VALUES are desired.
%   
%   Outputs:
%      INDICATOR_VALUES - A vector with N columns containing, in each I-th
%                         position, the value of INDICATOR for the I-th
%                         year
    [n,m]=size(lookup);
    padded_name = sprintf(['%-', num2str(m),'s'], lookup_value);    %all rows in a matrix must have the same number of columns. Matlab achieves this with spaces on the right. We must do the same with our query
    comparison_name = repmat(padded_name,n,1);
    matching_chars = lookup == comparison_name;
    matching_row = all(matching_chars,2);
    indicator_values = region_data(:, matching_row);
end

