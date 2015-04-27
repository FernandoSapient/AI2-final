% Importing Variable Dataset...
% IMPORTING DATA SET - import each variable from the EXCEL sheet to *.mat
% ...
clc;
close all
clear all;
display('Importing Datasets...');
%% Importing Dataset ...
all_vari = xlsread('All variables.xlsx');
%...
%% Importing Population Dataset ...
pop = xlsread('Population.xlsx');
[r_num c_num]=size(pop);
%% Do scaling variable Trademark applications, total ...
display('Scaling variable Trademark applications, total...');
variable_scaled=(all_vari(:,2)./pop(:,2))*100;
all_vari(:,2)=variable_scaled;
display('Done...');
%% Do scaling variable for Scientific and technical journal ...
display('Scaling variable for Scientific and technical journal...');
variable_scaled=(all_vari(:,3)./pop(:,2))*100;
all_vari(:,3)=variable_scaled;
display('Done...');
save('dataset.mat','all_vari');