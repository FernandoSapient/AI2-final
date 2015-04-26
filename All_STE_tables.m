%% Load files
load_into_mtx_autogen;
load_region_lookup_autogen;
load_var_name_autogen;

%% Compute tables
thresh = .125;
min = .5;
World = get_region(Allvariables, char(CountryName), 'World');
World_STE_deps = BN1.get_STE_dependencies(World,char(IndicatorName),thresh, min);
World_STE_vals = BN1.get_STE_values(World,char(IndicatorName));
EastAsia =  get_region(Allvariables, char(CountryName), 'East Asia & Pacific (all income levels)');
EastAsia_STE_deps = BN1.get_STE_dependencies(EastAsia,char(IndicatorName),thresh, min);
EastAsia_STE_vals = BN1.get_STE_values(EastAsia,char(IndicatorName));
Europe =  get_region(Allvariables, char(CountryName), 'Europe & Central Asia (all income levels)');
Europe_STE_deps = BN1.get_STE_dependencies(Europe,char(IndicatorName),thresh, min);
Europe_STE_vals = BN1.get_STE_values(Europe,char(IndicatorName));
LatinAmerica =  get_region(Allvariables, char(CountryName), 'Latin America & Caribbean (all income levels)');
LatinAmerica_STE_deps = BN1.get_STE_dependencies(LatinAmerica,char(IndicatorName),thresh, min);
LatinAmerica_STE_vals = BN1.get_STE_values(LatinAmerica,char(IndicatorName));
MiddleEast =  get_region(Allvariables, char(CountryName), 'Middle East & North Africa (all income levels)');
MiddleEast_STE_deps = BN1.get_STE_dependencies(MiddleEast,char(IndicatorName),thresh, min);
MiddleEast_STE_vals = BN1.get_STE_values(MiddleEast,char(IndicatorName));
Africa =  get_region(Allvariables, char(CountryName), 'Sub-Saharan Africa (all income levels)');
Africa_STE_deps = BN1.get_STE_dependencies(Africa,char(IndicatorName),thresh, min);
Africa_STE_vals = BN1.get_STE_values(Africa,char(IndicatorName));
NorthAmerica =  get_region(Allvariables, char(CountryName), 'North America');
NorthAmerica_STE_deps = BN1.get_STE_dependencies(NorthAmerica,char(IndicatorName),thresh, min);
NorthAmerica_STE_vals = BN1.get_STE_values(NorthAmerica,char(IndicatorName));
SouthAsia =  get_region(Allvariables, char(CountryName), 'South Asia');
SouthAsia_STE_deps = BN1.get_STE_dependencies(SouthAsia,char(IndicatorName),thresh, min);
SouthAsia_STE_vals = BN1.get_STE_values(SouthAsia,char(IndicatorName));
