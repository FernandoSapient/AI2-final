function [ table ] = combination( domains )
% combination - generate a table consists of all possible combinations of
%               the values from domains

    N = length(domains);
    table = [];
    
    domain = domains{1};
    if N == 1
        table = domain';
        return;
    end

    for v = domain
        values = combination( domains(2:N) );
        T = [ones(length(values), 1) * v  values];
        table = cat(1, table, T);
    end
end

