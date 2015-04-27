clc; clear all; close all;

% Load dataset
load('dataset.mat');
Dataset = all_vari(:,2:end);

% Load region lookup
load_region_lookup_autogen;

% Load indicator look
load_var_name_autogen;

% STE thesholds
thresh = .1;
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

missing = isnan(ppp) | isnan(agriculture) | isnan(journal);
P_PPP_given_Journal_Agriculture = CPT(ppp(~missing), journal(~missing), agriculture(~missing));

%% Region 2 : Europe & Central Africa
Europe =  get_region(Dataset, char(CountryName), 'Europe & Central Asia (all income levels)');
[Europe_STE_deps, Eurpe_STE_vals] = BN1.get_STE_values(Europe,char(IndicatorName), thresh, min);

journal = discretize(Europe(:,1));
agriculture = discretize(Europe(:,3));
industry = discretize(Europe(:,4));
government = discretize(Europe(:,7));
tertiary = discretize(Europe(:,11));
ppp = discretize(EastAsia(:, 9));

P_Tertiary = Pr(tertiary(~isnan(tertiary)), domain);

missing = isnan(journal) | isnan(tertiary);
P_Journal = CPT(journal(~missing), tertiary(~missing));

missing = isnan(agriculture) | isnan(tertiary);
P_Agriculture = CPT(agriculture(~missing), tertiary(~missing));

missing = isnan(industry) | isnan(tertiary);
P_Industry = CPT(industry(~missing), tertiary(~missing));

missing = isnan(government) | isnan(tertiary);
P_Government = CPT(government(~missing), tertiary(~missing));

missing = isnan(ppp) | ....
    isnan(agriculture) | isnan(journal) | isnan(agriculture) | isnan(industry) | isnan(government);
P_PPP_given_Journal_Agriculture_Industry_Government = CPT(...
    ppp(~missing), journal(~missing), agriculture(~missing), industry(~missing), government(~missing));
