%% Load files
load_into_mtx_autogen;
load_region_lookup_autogen;
load_var_name_autogen;

%% Compute tables
World = get_region(Allvariables, char(CountryName), 'World');
World_STE_deps = BN1.get_STE_dependencies(World,char(IndicatorName),0);
World_STE_vals = BN1.get_STE_values(World,char(IndicatorName),0);
EastAsia =  get_region(Allvariables, char(CountryName), 'East Asia & Pacific (all income levels)');
EastAsia_STE_deps = BN1.get_STE_dependencies(EastAsia,char(IndicatorName),0);
EastAsia_STE_vals = BN1.get_STE_values(EastAsia,char(IndicatorName),0);
Europe =  get_region(Allvariables, char(CountryName), 'East Asia & Pacific (all income levels)');
Europe_STE_deps = BN1.get_STE_dependencies(Europe,char(IndicatorName),0);
Europe_STE_vals = BN1.get_STE_values(Europe,char(IndicatorName),0);
LatinAmerica =  get_region(Allvariables, char(CountryName), 'East Asia & Pacific (all income levels)');
LatinAmerica_STE_deps = BN1.get_STE_dependencies(LatinAmerica,char(IndicatorName),0);
LatinAmerica_STE_vals = BN1.get_STE_values(LatinAmerica,char(IndicatorName),0);
MiddleEast =  get_region(Allvariables, char(CountryName), 'Middle East & North Africa (all income levels)');
MiddleEast_STE_deps = BN1.get_STE_dependencies(MiddleEast,char(IndicatorName),0);
MiddleEast_STE_vals = BN1.get_STE_values(MiddleEast,char(IndicatorName),0);
Africa =  get_region(Allvariables, char(CountryName), 'Sub-Saharan Africa (all income levels)');
Africa_STE_deps = BN1.get_STE_dependencies(MiddleEast,char(IndicatorName),0);
Africa_STE_vals = BN1.get_STE_values(MiddleEast,char(IndicatorName),0);
NorthAmerica =  get_region(Allvariables, char(CountryName), 'North America');
NorthAmerica_STE_deps = BN1.get_STE_dependencies(MiddleEast,char(IndicatorName),0);
NorthAmerica_STE_vals = BN1.get_STE_values(MiddleEast,char(IndicatorName),0);
SouthAsia =  get_region(Allvariables, char(CountryName), 'North America');
SouthAsia_STE_deps = BN1.get_STE_dependencies(MiddleEast,char(IndicatorName),0);
SouthAsia_STE_vals = BN1.get_STE_values(MiddleEast,char(IndicatorName),0);
