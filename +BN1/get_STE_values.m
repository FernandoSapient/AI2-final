function T = get_STE_dependencies( region_data, lookup, threshold )
%Automatically extracts and computes whether arcs are necessary between all
%the pairs of variables that compose REGION_DATA. Variables in this version
%are assumed to include, at least, agriculture, industry, government,
%articles, tertiary, and GDP. Full World Bank names are expected in LOOKUP.
%   Inputs:
%       REGION_DATA  - An N by M matrix containing all the values of the
%                      desired country, where n is the number of years
%                      and M is the number of indicators. Indicators must 
%                      be ordered as stated in LOOKUP
%       LOOKUP       - An index vector with M rows containing the 
%                      indicators that each row in INDICATOR corresponds
%                      to.
%       threshold - value at which the possibility is discarded. This value
%                   is taken as proportional to the means of y.
%                   (See DEPENDS_ON for more information    agriculture = get_all_years(region_data,char(lookup),'Agriculture, value added (% of GDP)');
    agriculture = get_all_years(region_data,char(lookup),'Agriculture, value added (% of GDP)');
    industry = get_all_years(region_data,char(lookup),'Industry, value added (% of GDP)');
    government = get_all_years(region_data,char(lookup),'General government final consumption expenditure (% of GDP)');
    articles = get_all_years(region_data,char(lookup),'Scientific and technical journal articles');
    gdp = get_all_years(region_data,char(lookup),'GDP growth (annual %)');
    tertiary = get_all_years(region_data,char(lookup),'Labor force with tertiary education (% of total)');
    
    T = BN1.dependency_values( tertiary, gdp, agriculture, industry, government, articles);
end
