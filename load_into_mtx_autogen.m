%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\Fernando\OneDrive\Documents\University of Missouri\Spring 2015\Artificial Intelligence\AI2-final\Datasets\All variables.xlsx
%    Worksheet: Data
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB using the Import Data wizard

%% Import the data
[~, ~, raw] = xlsread('Datasets/All variables.xlsx','Data','C2:N441');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
Allvariables = reshape([raw{:}],size(raw));

%% Clear temporary variables
clearvars raw R;