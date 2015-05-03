clc; clear all; close all;

% Load dataset
load('dataset.mat');
Dataset = all_vari(:,2:end);

% Load region lookup
load_region_lookup_autogen;

% Load indicator look
load_var_name_autogen;

% STE thesholds
thresh = .03;
min = .5;

% Assume domain = ['H', 'M', 'L']' for all discretized variables;
domain = ['H' 'M' 'L']' + 0;

% Laplacian smoothing parameter
set_laplace_k(1);

%% Region 1 : East Asia & Pacific
EastAsia =  get_region(Dataset, char(CountryName), 'East Asia & Pacific (all income levels)');
[EastAsia_STE_deps, EastAsia_STE_vals] = BN1.get_STE_values(EastAsia, char(IndicatorName), thresh, min);

journal = discretize(EastAsia(:,1));
agriculture = discretize(EastAsia(:,3));
ppp = discretize(EastAsia(:, 9));

P_Journal = Pr(journal(~isnan(journal)), domain);
P_Agriculture = Pr(agriculture(~isnan(agriculture)), domain);

missing = isnan(ppp) | isnan(journal) | isnan(agriculture);
P_PPP_given_Journal_Agriculture = CPT(ppp(~missing), journal(~missing), agriculture(~missing));

display(P_Journal);
display(P_Agriculture);
display(P_PPP_given_Journal_Agriculture);

%% Region 2 : Europe & Central Africa
Europe =  get_region(Dataset, char(CountryName), 'Europe & Central Asia (all income levels)');
[Europe_STE_deps, Eurpe_STE_vals] = BN1.get_STE_values(Europe,char(IndicatorName), thresh, min);

journal = discretize(Europe(:,1));
agriculture = discretize(Europe(:,3));
industry = discretize(Europe(:,4));
tertiary = discretize(Europe(:,11));
ppp = discretize(Europe(:, 9));

P_Tertiary = Pr(tertiary(~isnan(tertiary)), domain);
P_Agriculture = Pr(agriculture(~isnan(agriculture), domain));

missing = isnan(journal) | isnan(tertiary);
P_Journal_given_Tertiary = CPT(journal(~missing), tertiary(~missing));

missing = isnan(industry) | isnan(tertiary);
P_Industry_given_Tertiary = CPT(industry(~missing), tertiary(~missing));

missing = isnan(ppp) | isnan(journal) | isnan(agriculture) | isnan(industry);
P_PPP_given_Journal_Agriculture_Industry = CPT(...
    ppp(~missing), journal(~missing), agriculture(~missing), industry(~missing));

display(P_Tertiary);
display(P_Journal_given_Tertiary);
display(P_Agriculture);
display(P_Industry_given_Tertiary);
display(P_PPP_given_Journal_Agriculture_Industry);

%% Region 3 : Latin America & Caribbean
LatinAmerica =  get_region(Dataset, char(CountryName), 'Latin America & Caribbean (all income levels)');
[LatinAmerica_STE_deps, LatinAmerica_STE_vals] = BN1.get_STE_values(LatinAmerica,char(IndicatorName), thresh, min);

tertiary = discretize(LatinAmerica(:,11));
journal = discretize(LatinAmerica(:,1));
agriculture = discretize(LatinAmerica(:,3));
ppp = discretize(LatinAmerica(:, 9));

P_Tertiary = Pr(tertiary(~isnan(tertiary)), domain);
P_Journal = Pr(journal(~isnan(journal)), domain);

missing = isnan(agriculture) | isnan(tertiary);
P_Agriculture_given_Tertiary = CPT(agriculture(~missing), tertiary(~missing));

missing = isnan(ppp) | isnan(journal) | isnan(agriculture);
P_PPP_given_Journal_Agriculture = CPT(ppp(~missing), journal(~missing), agriculture(~missing));

display(P_Tertiary);
display(P_Journal);
display(P_Agriculture_given_Tertiary);
display(P_PPP_given_Journal_Agriculture);

%% Region 4 : Middle East & North Africa
MiddleEast =  get_region(Dataset, char(CountryName), 'Middle East & North Africa (all income levels)');
[MiddleEast_STE_deps, MiddleEast_STE_vals] = BN1.get_STE_values(MiddleEast,char(IndicatorName), thresh, min);

journal = discretize(MiddleEast(:,1));
agriculture = discretize(MiddleEast(:,3));
industry = discretize(MiddleEast(:,4));
government = discretize(MiddleEast(:,7));
ppp = discretize(MiddleEast(:, 9));

P_Journal = Pr(journal(~isnan(journal)), domain);
P_Agriculture = Pr(agriculture(~isnan(agriculture)), domain);
P_Industry = Pr(industry(~isnan(industry)), domain);
P_Government = Pr(government(~isnan(government)), domain);

missing = isnan(ppp) | ...
     isnan(journal) |isnan(agriculture) | isnan(industry) | isnan(government);
P_PPP_given_Journal_Agriculture_Industry_Government = CPT(...
    ppp(~missing), journal(~missing), agriculture(~missing), industry(~missing), government(~missing));

display(P_Journal);
display(P_Agriculture);
display(P_Industry);
display(P_Government);
display(P_PPP_given_Journal_Agriculture_Industry_Government);

%% Region 5 : South Asia
SouthAsia =  get_region(Dataset, char(CountryName), 'South Asia');
[SouthAsia_STE_deps, SouthAsia_STE_vals] = BN1.get_STE_values(SouthAsia,char(IndicatorName), thresh, min);

tertiary = discretize(SouthAsia(:,11));
journal = discretize(SouthAsia(:,1));
ppp = discretize(SouthAsia(:,9));

P_Tertiary = Pr(tertiary(~isnan(tertiary)), domain);

missing = isnan(journal) | isnan(tertiary);
P_Journal_given_Tertiary = CPT(journal(~missing), tertiary(~missing));

missing = isnan(ppp) | isnan(journal);
P_PPP_given_Journal = CPT(ppp(~missing), journal(~missing));

display(P_Tertiary);
display(P_Journal_given_Tertiary);
display(P_PPP_given_Journal);

%% Region 6 : Sub-saharan Africa
Africa =  get_region(Dataset, char(CountryName), 'Sub-Saharan Africa (all income levels)');
[Africa_STE_deps, Africa_STE_vals] = BN1.get_STE_values(Africa,char(IndicatorName), thresh, min);

journal = discretize(Africa(:,1));
agriculture = discretize(Africa(:,3));
ppp = discretize(Africa(:, 9));

P_Journal = Pr(journal(~isnan(journal)), domain);
P_Agriculture = Pr(agriculture(~isnan(agriculture)), domain);

missing = isnan(ppp) | isnan(journal) | isnan(agriculture);
P_PPP_given_Journal_Agriculture = CPT(ppp(~missing), journal(~missing), agriculture(~missing));

display(P_Journal);
display(P_Agriculture);
display(P_PPP_given_Journal_Agriculture);

%% Region 7 : North America
NorthAmerica =  get_region(Dataset, char(CountryName), 'North America');
[NorthAmerica_STE_deps, NorthAmerica_STE_vals] = BN1.get_STE_values(NorthAmerica,char(IndicatorName), thresh, min);

tertiary = discretize(NorthAmerica(:,11));
journal = discretize(NorthAmerica(:,1));
agriculture = discretize(NorthAmerica(:,3));
ppp = discretize(NorthAmerica(:, 9));

P_Tertiary = Pr(tertiary(~isnan(tertiary)), domain);
P_Agriculture = Pr(agriculture(~isnan(agriculture)), domain);

missing = isnan(journal) | isnan(tertiary);
P_Journal_given_Tertiary = CPT(journal(~missing), tertiary(~missing));

missing = isnan(journal) | isnan(agriculture) | isnan(ppp);
P_PPP_given_Journal_Agriculture = CPT(ppp(~missing), journal(~missing), agriculture(~missing));

display(P_Tertiary);
display(P_Agriculture);
display(P_Journal_given_Tertiary);
display(P_PPP_given_Journal_Agriculture);

%% Region 8 : World
World = get_region(Dataset, char(CountryName), 'World');
[World_STE_deps_1, World_STE_vals_1] = BN1.get_STE_values(World,char(IndicatorName), thresh, min);

agriculture = discretize(World(:,3));
ppp = discretize(World(:,9));

P_Agriculture = Pr(agriculture(~isnan(agriculture)), domain);

missing = isnan(agriculture) | isnan(ppp);
P_PPP_given_Agriculture = CPT(ppp(~missing), agriculture(~missing));

display(P_Agriculture);
display(P_PPP_given_Agriculture);