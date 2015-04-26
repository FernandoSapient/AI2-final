function T = dependencies_v1( tertiary, gdp, agriculture, industry, government, articles, threshold, minimum)
%Gets all dependencies for the version 1 network as a table. The first
%column indicating if the variable is dependent on education, the second
%column indicating if GDP is dependent on that variable
    T = table(true(4,1), true(4,1), 'RowNames', {'Agriculture', 'Industry', 'Government', 'Articles'}, 'VariableNames', {'Tertiary', 'GDP'});
    T('Agriculture', 'Tertiary') = {STE.depends_on(agriculture, tertiary, threshold, minimum)};
    T('Agriculture', 'GDP') = {STE.depends_on(gdp, agriculture, threshold, minimum)};
    T('Industry', 'Tertiary') = {STE.depends_on(industry, tertiary, threshold, minimum)};
    T('Industry', 'GDP') = {STE.depends_on(gdp, industry, threshold, minimum)};
    T('Government', 'Tertiary') = {STE.depends_on(government, tertiary, threshold, minimum)};
    T('Government', 'GDP') = {STE.depends_on(gdp, government, threshold, minimum)};
    T('Articles', 'Tertiary') = {STE.depends_on(articles, tertiary, threshold, minimum)};
    T('Articles', 'GDP') = {STE.depends_on(gdp, articles, threshold, minimum)};
end

