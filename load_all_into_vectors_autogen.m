%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\fthc8\Desktop\all.xls Worksheet: Sheet1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB using the Import Data wizard

%% Import the data
[~, ~, raw] = xlsread('all.xls','Sheet1','A2:Q3425');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[1,2,3,4]);
raw = raw(:,[5,6,7,8,9,10,11,12,13,14,15,16,17]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
IndicatorName = cellVectors(:,1);
IndicatorCode = cellVectors(:,2);
CountryName = cellVectors(:,3);
CountryCode = cellVectors(:,4);
x98 = data(:,1);
x99 = data(:,2);
x00 = data(:,3);
x01 = data(:,4);
x02 = data(:,5);
x03 = data(:,6);
x04 = data(:,7);
x05 = data(:,8);
x06 = data(:,9);
x07 = data(:,10);
x08 = data(:,11);
x09 = data(:,12);
x10 = data(:,13);

%% Clear temporary variables
clearvars data raw cellVectors R;