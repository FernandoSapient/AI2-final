load_all_into_vectors_autogen;

data = cat(2, x98, x99, x00, x01, x02, x03, x04, x05, x06, x07, x08, x09, x10);

get_articles;

USA_articles = get_all_years(articles, articles_lookup, 'USA');

plot(1998:2010,USA_articles);
title('Number of journal articles published in the United States');
xlabel('year');
ylabel('articles');
set(gca,'YTickLabel',separatethousands(get(gca,'YTick').',','))


%% Discretize GDP growth into {H, M, L}
GDP = csvread('gdp_growth.csv');

% Region 1-8
r1 = discretize(GDP(:, 1));
r2 = discretize(GDP(:, 2));
r3 = discretize(GDP(:, 3));
r4 = discretize(GDP(:, 4));
r5 = discretize(GDP(:, 5));
r6 = discretize(GDP(:, 6));
r7 = discretize(GDP(:, 7));
r8 = discretize(GDP(:, 8));
