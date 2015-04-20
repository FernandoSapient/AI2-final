function indicator_values = get_all_years(indicator, lookup, lookup_value)
%Gets the values of the given indicator for the given country for all the
%M years that the variable spans
%   Inputs:
%       INDICATOR    - An N by M matrix containing all the values of the
%                      desired indicator, where n is the number of countries
%                      and M is the number of years. Values must be ordered 
%                      as stated in LOOKUP
%       LOOKUP       - An index vector with M rows containing the country 
%                      codes that each row in INDICATOR corresponds to.
%       LOOKUP_VALUE - The value to find in LOOKUP, and for which the
%                      INDICATOR_VALUES are desired. Should be the same
%                      length as the columns of LOOKUP. If the values in
%                      LOOKUP are padded, LOOKUP_VALUE should be padded as
%                      well to ensure success of the eq operation.
%   
%   Outputs:
%      INDICATOR_VALUES - A vector with N columns containing, in each I-th
%                         position, the value of INDICATOR for the I-th
%                         year
    indicator_values = indicator(all(lookup==repmat(lookup_value,size(lookup,1),1),2),:);
end

