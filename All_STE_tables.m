%% Load files
clc;
load_into_mtx_autogen;
load_region_lookup_autogen;
load_var_name_autogen;

%% Compute tables
thresh = .1;
min = .5;
World = get_region(Allvariables, char(CountryName), 'World');
[World_STE_deps_1, World_STE_vals_1] = BN1.get_STE_values(World,char(IndicatorName), thresh, min);
[World_STE_deps_2, World_STE_vals_2] = BN2.get_STE_values(World,char(IndicatorName), thresh, min);
EastAsia =  get_region(Allvariables, char(CountryName), 'East Asia & Pacific (all income levels)');
[EastAsia_STE_deps_1, EastAsia_STE_vals_1] = BN1.get_STE_values(EastAsia,char(IndicatorName), thresh, min);
[EastAsia_STE_deps_2, EastAsia_STE_vals_2] = BN2.get_STE_values(EastAsia,char(IndicatorName), thresh, min);
Europe =  get_region(Allvariables, char(CountryName), 'Europe & Central Asia (all income levels)');
[Europe_STE_deps_1, Eurpe_STE_vals_1] = BN1.get_STE_values(Europe,char(IndicatorName), thresh, min);
[Europe_STE_deps_2, Eurpe_STE_vals_2] = BN2.get_STE_values(Europe,char(IndicatorName), thresh, min);
LatinAmerica =  get_region(Allvariables, char(CountryName), 'Latin America & Caribbean (all income levels)');
[LatinAmerica_STE_deps_1, LatinAmerica_STE_vals_1] = BN1.get_STE_values(LatinAmerica,char(IndicatorName), thresh, min);
[LatinAmerica_STE_deps_2, LatinAmerica_STE_vals_2] = BN2.get_STE_values(LatinAmerica,char(IndicatorName), thresh, min);
MiddleEast =  get_region(Allvariables, char(CountryName), 'Middle East & North Africa (all income levels)');
[MiddleEast_STE_deps_1, MiddleEast_STE_vals_1] = BN1.get_STE_values(MiddleEast,char(IndicatorName), thresh, min);
[MiddleEast_STE_deps_2, MiddleEast_STE_vals_2] = BN2.get_STE_values(MiddleEast,char(IndicatorName), thresh, min);
Africa =  get_region(Allvariables, char(CountryName), 'Sub-Saharan Africa (all income levels)');
[Africa_STE_deps_1, Africa_STE_vals_1] = BN1.get_STE_values(Africa,char(IndicatorName), thresh, min);
[Africa_STE_deps_2, Africa_STE_vals_2] = BN2.get_STE_values(Africa,char(IndicatorName), thresh, min);
NorthAmerica =  get_region(Allvariables, char(CountryName), 'North America');
[NorthAmerica_STE_deps_1, NorthAmerica_STE_vals_1] = BN1.get_STE_values(NorthAmerica,char(IndicatorName), thresh, min);
[NorthAmerica_STE_deps_2, NorthAmerica_STE_vals_2] = BN2.get_STE_values(NorthAmerica,char(IndicatorName), thresh, min);
SouthAsia =  get_region(Allvariables, char(CountryName), 'South Asia');
[SouthAsia_STE_deps_1, SouthAsia_STE_vals_1] = BN1.get_STE_values(SouthAsia,char(IndicatorName), thresh, min);
[SouthAsia_STE_deps_2, SouthAsia_STE_vals_2] = BN2.get_STE_values(SouthAsia,char(IndicatorName), thresh, min);
