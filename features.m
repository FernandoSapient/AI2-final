function [ agr,ind,jour] = features()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
        clc;
        display('___________________________________');
        display(' ');
        display('        Compute Query of the PPP   ');  
        display('___________________________________');
        display('                                   ');
        display('          Agr. Rate Domain         ');
        display('___________________________________');
        display('___________________________________');
        display('          1: H for High...');
        display('          2: M for Medium...');
        display('          3: L for Low...');
        display('___________________________________');
        display('___________________________________');        
        agr = input(' Enter the Agr. domain :','s');
        display(' ');
        clc;
        display('___________________________________');
        display(' ');
        display('        Compute Query of the PPP   ');  
        display('___________________________________');
        display('                                   ');
        display('         Inds. Rate Domain         ');
        display('___________________________________');
        display('___________________________________');
        display('         1: H for High...');
        display('         2: M for Medium...');
        display('         3: L for Low...');
        display('___________________________________');
        display('___________________________________');        
        display('                                   ');
        ind = input(' Enter Ind. rate domain : ','s');
        display(' ');
        clc;
        display('___________________________________');
        display(' ');
        display('        Compute Query of the PPP   ');  
        display('___________________________________');
        display('                                   ');
        display('         Jour. Rating Domain       ');
        display('___________________________________');
        display('___________________________________');
        display('         1: H for High...          ');
        display('         2: M for Medium...        ');
        display('         3: L for Low...           ');
        display('___________________________________');
        display('___________________________________');
        display('                                   ');
        jour = input(' Enter sJour. rate domain : ','s');
        display(' ');
        agr
        ind
        jour
end