function T = dependencies_v1( tertiary, gdp, agriculture, industry, government, articles, threshold)
%Gets all dependencies for the version 1 network as a table. The first
%column indicating if the variable is dependent on education, the second
%column indicating if GDP is dependent on that variable
    T = table(true(4,1), true(4,1), 'RowNames', {'Agriculture', 'Industry', 'Government', 'Articles'}, 'VariableNames', {'Tertiary', 'GDP'});
    T('Agriculture', 'Graduates') = depends_on(agriculture, tertiary, threshold);
    T('Agriculture', 'GDP') = depends_on(gdp, agriculture, threshold);
    T('Industry', 'Graduates') = depends_on(industry, tertiary, threshold);
    T('Industry', 'GDP') = depends_on(gdp, industry, threshold);
    T('Government', 'Graduates') = depends_on(government, tertiary, threshold);
    T('Government', 'GDP') = depends_on(gdp, government, threshold);
    T('Articles', 'Graduates') = depends_on(articles, tertiary, threshold);
    T('Articles', 'GDP') = depends_on(gdp, articles, threshold);
end

