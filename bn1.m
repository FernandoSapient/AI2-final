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
