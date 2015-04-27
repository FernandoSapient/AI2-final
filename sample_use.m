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

%% combination.m
domains = {};
domains{1} = 'HML' + 0;
domains{2} = 'HML' + 0;
domains{3} = 'HML' + 0;

A = combination(domains);

%% Learn parameters for BN_1
set_laplace_k(1);

region_1 = csvread('experiment/region_1.csv');
region_1(region_1 == 0) = nan;

journal = region_1(:,1);
agriculture = discretize(region_1(:,3));
industry = discretize(region_1(:,4));
government = discretize(region_1(:,7));
gdp_growth = discretize(region_1(:,8));

domain = ('HML')';

P_Agriculture = Pr(agriculture(~isnan(agriculture)), domain);
P_Industry = Pr(industry(~isnan(industry)), domain);
P_Government = Pr(government(~isnan(government)), domain);

% I need Journal article to be scaled
% P_Journal = Pr(journal, 'HML');

%%
missing = isnan(gdp_growth) | isnan(agriculture) | isnan(industry) | isnan(government);

% P_GDP_given_Agriculture_Industry_Government = CPT(...
%     gdp_growth(~missing), agriculture(~missing), industry(~missing), government(~missing));
