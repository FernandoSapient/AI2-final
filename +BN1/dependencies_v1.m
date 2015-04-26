function T = dependencies_v1( tertiary, gdp, agriculture, industry, government, articles, threshold)
%Gets all dependencies for the version 1 network as a table. The first
%column indicating if the variable is dependent on education, the second
%column indicating if GDP is dependent on that variable
    T = table(true(4,1), true(4,1), 'RowNames', {'Agriculture', 'Industry', 'Government', 'Articles'}, 'VariableNames', {'Tertiary', 'GDP'});
    T('Agriculture', 'Tertiary') = {STE.depends_on(agriculture, tertiary, threshold)};
    T('Agriculture', 'GDP') = {STE.depends_on(gdp, agriculture, threshold)};
    T('Industry', 'Tertiary') = {STE.depends_on(industry, tertiary, threshold)};
    T('Industry', 'GDP') = {STE.depends_on(gdp, industry, threshold)};
    T('Government', 'Tertiary') = {STE.depends_on(government, tertiary, threshold)};
    T('Government', 'GDP') = {STE.depends_on(gdp, government, threshold)};
    T('Articles', 'Tertiary') = {STE.depends_on(articles, tertiary, threshold)};
    T('Articles', 'GDP') = {STE.depends_on(gdp, articles, threshold)};
end

