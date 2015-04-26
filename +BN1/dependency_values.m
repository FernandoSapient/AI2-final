function T = dependency_values( tertiary, gdp, agriculture, industry, government, articles)
%Gets all dependencies for the version 1 network as a table. The first
%column indicating if the variable is dependent on education, the second
%column indicating if GDP is dependent on that variable
    T = table(zeros(4,1), zeros(4,1), zeros(4,1), zeros(4,1), 'RowNames', {'Agriculture', 'Industry', 'Government', 'Articles'}, 'VariableNames', {'Tertiary_to_var', 'var_to_Tertiary', 'GDP_to_var', 'var_to_GDP'});
    [T('Agriculture', 'Tertiary_to_var'), T('Agriculture', 'var_to_Tertiary')] = cellified_deps(agriculture, tertiary);
    [T('Agriculture', 'var_to_GDP'), T('Agriculture', 'GDP_to_var')] = cellified_deps(gdp, agriculture);
    [T('Industry', 'Tertiary_to_var'), T('Industry', 'var_to_Tertiary')] = cellified_deps(industry, tertiary);
    [T('Industry', 'var_to_GDP'), T('Industry', 'GDP_to_var')] = cellified_deps(gdp, industry);
    [T('Government', 'Tertiary_to_var'), T('Government', 'Tertiary_to_var')] = cellified_deps(government, tertiary);
    [T('Government', 'var_to_GDP'), T('Government', 'GDP_to_var')] = cellified_deps(gdp, government);
    [T('Articles', 'Tertiary_to_var'), T('Articles', 'var_to_Tertiary')] = cellified_deps(articles, tertiary);
    [T('Articles', 'var_to_GDP'), T('Articles', 'GDP_to_var')] = cellified_deps(gdp, articles);
end

function [celledA, celledB] = cellified_deps(arg1, arg2)
    valid = ~isnan(arg1) & ~isnan(arg2);
    try
        [a,b] = STE.dependency(arg1(valid),arg2(valid));
    catch
        a=NaN;
        b=NaN;
    end
    celledA = {a};
    celledB = {b};
end