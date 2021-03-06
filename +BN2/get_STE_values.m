function [T, V] = get_STE_values( region_data, lookup, threshold, minimum )
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
%       threshold & minimum - value at which the possibility is discarded. This value
%                   is taken as proportional to the means of y.
%                   (See DEPENDS_ON for more information);
%   
%   Outputs
%       T - A table of logicals indicating, in the first column, whether
%           each variable is dependent on education and, in the second,
%           whether GDP is dependent on that variable
%       V - A table of reals indicating the values used to compute T where
%           "to" indicates the examined direction of the arrow. Each value
%           is 
    articles = get_all_years(region_data,char(lookup),'Scientific and technical journal articles');
    trademarks = get_all_years(region_data,char(lookup),'Trademark applications, total');
    agriculture = get_all_years(region_data,char(lookup),'Agriculture, value added (% of GDP)');
    industry = get_all_years(region_data,char(lookup),'Industry, value added (% of GDP)');
    services = get_all_years(region_data,char(lookup),'Services, etc., value added (% of GDP)');
    government = get_all_years(region_data,char(lookup),'General government final consumption expenditure (% of GDP)');
    gdp_growth = get_all_years(region_data,char(lookup),'GDP growth (annual %)');
    ppp = get_all_years(region_data,char(lookup),'GDP per capita, PPP (constant 2011 international $)');
    secondary = get_all_years(region_data,char(lookup),'Labor force with secondary education (% of total)');
    tertiary = get_all_years(region_data,char(lookup),'Labor force with tertiary education (% of total)');
    unemployment = get_all_years(region_data,char(lookup),'Unemployment, total (% of total labor force) (modeled ILO estimate)');
    
    V = STE.dependency_values(...
        {'Agriculture', 'Industry', 'Services', 'Unemployment'},...
        { agriculture,   industry,   services,   unemployment},...
        {'Secondary' 'Tertiary', 'Articles', 'Trademarks', 'Government', 'GDP_growth', 'PPP'},...
        { secondary,  tertiary,   articles,   trademarks,   government,   gdp_growth,   ppp},...
        [ true,       true,       true,       true,         true,         false,        false]);
    T = STE.dependency_table( V, threshold, minimum);
end

